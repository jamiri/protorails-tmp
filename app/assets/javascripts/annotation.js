jQuery(function ($) {

  $('#annotations').delegate('.button.red', 'click', function() {

    alert("red");
  
  });

  var range, sel;
  $('#lesson-script').mouseup(function(e) {
    sel = window.getSelection();
    if (sel.rangeCount && sel.getRangeAt) {
      range = sel.getRangeAt(0);
    }
    if (range) {
      sel.removeAllRanges();
      sel.addRange(range);
    }

    if(range && !sel.isCollapsed) {

      var x = e.pageX;
      var y = e.pageY;
      $('#add-note').hide(1, function() {
        $(this).css('left', x + "px")
        .css('top', y + "px").fadeIn(100);
      });
    }
    else {
      $('#add-note').hide();
    }
  });

  $('#add-note').click(function(e) {

    var order = getAnnotationOrder();
    var node = $("<span class='annotation-highlight-green'>")[0];
    $(node).data('order', order);
    range.surroundContents(node);
    $(this).hide();

    var $ann = $('<a/>').html($('#annotation-template').text()).contents();
    $ann.hide();
    $ann.data('order', order);
    $('#annotations').append($ann);
    $ann.fadeIn();  
    $ann.find('p').focus();


  });

  var getAnnotationOrder = function() {
    
    return $('#annotations .note').length;
  
  };



});
