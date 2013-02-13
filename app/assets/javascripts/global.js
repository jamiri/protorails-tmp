//Ensures that functions are run when DOM is ready and $ refers to jQuery
jQuery(function ($) {

    // Adds border-bottom to fixed header.sass on scroll down
    function addBorderBottom() {
        var top = $("body").scrollTop() > 0 ? $("body").scrollTop() : $("html").scrollTop();
        top > 150 ? $('#row2').addClass("border-bottom") : $('#row2').removeClass("border-bottom");
    }


//-------------------------------------------------------------------------------------------
    $('.winbox').click(function (event) {
        event.stopPropagation();
    });

    //---------------------------------- tab function in category section----------------------------------
    var items = $('#tabs>li').click(function (ev) {
        items.removeClass('current');
        $(this).addClass('current');
    });
    //---------------------------------- tab function in category section----------------------------------

    //---------------------------------------------show and hide sign-up form----------------------------------
    $('a.join').click(function () {
        $('#sign-in').attr('display', 'none');
        $('#sign-up').attr('display', 'block');
    });

    $('button#joincancel').click(function () {
        $('#sign-up').attr('display', 'none');
        $('#sign-in').attr('display', 'table-cell');
    });
    //---------------------------------------------show and hide sign-up form----------------------------------

    function hideWinboxes() {
        $('.winbox:visible').animate({
                height:'hide'
            }, 300
        );
    }

    //----------------------------------smooth scrolling for navigation menu----------------------------------
    $('a.nav').click(function (ev) {
        ev.preventDefault();

        $('html, body').stop(true).animate({
            scrollTop:$('#' + this.title).offset().top - 215
        }, 1500, 'easeOutExpo');

        $('a.active').removeClass();
        $(this).addClass('active');
    });
    //----------------------------------smooth scrolling for navigation menu----------------------------------

    $('#loginbtn').click(function (ev) {
        $('#sign-up').hide();
        $('#sign-in').animate({
                height:'toggle'
            }, 300
        );

        ev.stopPropagation();
    });

    $('#joinbtn').click(function (ev) {
        $('#sign-in').hide();
        $('#sign-up').animate({
                height:'toggle'
            }, 300
        );

        ev.stopPropagation();
    })

    $('.cancel').click(function (ev) {
        ev.preventDefault();

        $(ev.target).parents('.winbox').animate({
                height:'hide'
            }, 300
        );
    })

    $('body').keydown(function (ev) {
        if (ev.keyCode === 27) { // escape
            hideWinboxes();
        }
    })

    $('body').click(hideWinboxes);

    $(document).scroll(function () {
        addBorderBottom();
    });
    globals.toggleLessonDescription();
});


var globals = {
    toggleLessonDescription:function () {
        jQuery(function ($) {
            $('#less.sass ul li').bind("mouseenter", function () {
                $(this).find('div.description').delay(200).fadeIn();
            });

            $('#less.sass ul li').bind("mouseleave", function () {
                $(this).find('div.description').stop(true).fadeOut();
            });
        });
    },

    setActiveMenu:function () {
        // Sets active menu on scroll based on visible section of page
        $('a.nav').each(function () {
            var divTop = $('#' + this.title).offset().top;
            var top = $("body").scrollTop() > 0 ? $("body").scrollTop() : $("html").scrollTop();
            var distance = divTop - top;
            if (distance > 150 && distance < 300) {
                $('a.active').removeClass('active');
                $(this).addClass('active');
            }
        });
    }
};