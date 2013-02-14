jQuery(function ($) {

  $('#annotations').delegate('p:not(#guideline)', 'keydown', function(e) {
   
    
    if (e.which === 13) {
      
      var newContent = $(this).html();
      newContent = newContent.replace(/<div>/g, '');
      newContent = newContent.replace(/<\/div>/g, '<br>');
      $(this).html(newContent);    
      $(this).keydown(13);

    }
  
  });


  // Change color and delete
  $('#annotations').delegate('.button', 'click', function() {
    var clickedOn = $(this).attr('class').replace("button ", "");
    var annotationDiv = $(this).parent().parent();
    var order = annotationDiv.attr('data-order');

    if (clickedOn !== 'minimize' && clickedOn !== 'delete') {
      var color = clickedOn;
      $('.annotation-highlight[data-order=' + order + ']').removeClass()
        .addClass('annotation-highlight annotation-highlight-' + color);
      annotationDiv.removeClass().addClass('note ' + color);
    }
    
    else if (clickedOn === 'delete') {
      
      annotationDiv.fadeOut(200, function() {
        $(this).remove();
      });
      
      $('.annotation-highlight[data-order=' + order + ']').contents().unwrap();
    
    }

    else {
    
      annotationDiv.find('p').toggle();

    }


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
    var node = $("<span class='annotation-highlight-green annotation-highlight' data-order='" 
      + order + "'>")[0];
    range.surroundContents(node);
    $(this).hide();

    var ann = $('<a/>').html($('#annotation-template').text()).contents();
    // ann.data('order', order);
    ann.attr('data-order', order);
    $('#annotations').append(ann);
    ann.fadeIn();  
    ann.find('p').focus();


  });

  var getAnnotationOrder = function() {
    
    return $('#annotations .note').length;
  
  };



});
