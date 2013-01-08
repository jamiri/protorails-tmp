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
});
    