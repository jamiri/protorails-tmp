jQuery(function ($) {

    //---------------------------------------------lesson content tabbed area-----------------------------
    $('#lesson-content ul.nav li a').click(function (e) {
        e.preventDefault();

        if ($(this).hasClass('current'))
            return;
        else {
            $('#lesson-content ul.nav li a').removeClass('current');
            $(this).addClass('current');
            // This variable is used to cache selected jQuery object
            var activatingTab = $('#Tab_Content >div#' + this.title);
            var h;
            if (this.title == 'MicroBlog' && tabContentUtil.DetailsAreDisplayed)
               h = tabContentUtil.detailsHeight;
            else h = activatingTab.height();

            $('#Tab_Content').animate({
                'height':h
            });
            $.when($('#Tab_Content >div').fadeOut()).done(function () {
                activatingTab.fadeIn();
            });
        }
    });

    //---------------------------------------------Show detailed view in Micro Blog----------------------------------
    $('#summaries li a.switch').click(function (e) {
        e.preventDefault();

        $('#summaries').css("display", "none");
        tabContentUtil.DetailsAreDisplayed = true;

        var id = $(this).parent().parent().attr("data-order");
        var h = $('#details li[data-order="' + id + '"]').height();
        tabContentUtil.detailsHeight = h;
        $('#details').addClass('microblog-details-hidden');
        $('#details li[data-order="' + id + '"]').css("display", "block");
        $('#Tab_Content').height(h+10);

        $('#details').css("left", "940px");
        $('#details').animate({
            left:'0'
        }, 800);
    });

    //---------------------------------------------Return to summaries view in Micro Blog----------------------------------
    $('#details a.switch').click(function (e) {
        e.preventDefault();

        $(this).parent().parent().css("display", "none");
        tabContentUtil.DetailsAreDisplayed = false;
        var summaries = $('#summaries');
        var h = summaries.height();
        $('#Tab_Content').height(h);
        $('#details').removeClass('microblog-details-hidden');
        summaries.animate({
            width:'toggle'}, 800);
    });

});



// This object helps to overcome problem of switching tabs when microblog summaries are displayed
var tabContentUtil = {
    detailsHeight: null,
    DetailsAreDisplayed: false
};

