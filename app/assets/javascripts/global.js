$(document).scroll(function () {

    var top = $("body").scrollTop() > 0 ? $("body").scrollTop() : $("html").scrollTop()
    top > 150 ? $('#row2').css("border-bottom", "2px solid #666") : $('#row2').css("border-bottom", "none");

});