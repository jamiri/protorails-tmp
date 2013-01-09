jQuery(function ($) {

    $('#Lesson_Content ul.nav li a').click(function (e) {
        e.preventDefault();
        if ($(this).hasClass('current'))
            return;
        else
        {
            $('#Lesson_Content ul.nav li a').removeClass('current');
            $(this).addClass('current');
            $.when($('#Tab_Content >div').fadeOut()).done(function () {
                $('#Tab_Content >div#' + this.title).fadeIn();
            }.bind(this));
        }
    });

    //---------------------------------------------switch post view in Micro Blog----------------------------------
    $('#summaries li a.switch').click(function(){

        $('#summaries').css("display", "none");

        var id = $(this).parent().parent().attr("data-order");
        var h =  $('#details li[data-order="' + id + '"]').height();

        $('#details').addClass('microblog-details-hidden');
        $('#details li[data-order="' + id + '"]').css("display", "block");
        $('#Tab_Content').css("height", h );

        $('#details').css("left", "940px");
        $('#details').animate({
            left: '0'
        }, 200);

    });

    $('#details a.switch').click(function(){

        $(this).parent().parent().css("display", "none");
        $('#Tab_Content').css("height", "");
        $('#details').removeClass('microblog-details-hidden');



        $('#summaries').animate({
            width: 'toggle'}, 200);

//        $(this).parent().parent().css("display", "none");
//        $('#summaries').css("display", "block");

    });
    //---------------------------------------------switch post view in Micro Blog----------------------------------

    //---------------------------------------------append reply post to it's parent post----------------------------------
    function reply(){

        var $user = $('#reply-form input[type=text]').val();
        var $postText = $('#reply-form textarea').val();

        $('#Discussion div.post-body').append('' +
            '<div class="reply">' +
            '<span class="id">' +
            $user
            +'<a class="vote-up" title="vote up this!">&nbsp;</a>' +
            '<a class="vote-down" title="vote down this!">&nbsp;</a>' +
            '<a class="reply-button" title="reply to this post!">&nbsp;</a>' +
            '</span>'+
            '<p>'+
            $postText
            +'</p>'
            +'</div>'
            + '');
    }
    //---------------------------------------------append reply post to it's parent post----------------------------------
});
    