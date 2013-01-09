//Ensures that functions are run when DOM is ready and $ refers to jQuery
jQuery(function ($) {
    // Adds border-bottom to fixed header on scroll down
    function addBorderBottom() {
        var top = $("body").scrollTop() > 0 ? $("body").scrollTop() : $("html").scrollTop();
        top > 150 ? $('#row2').addClass("border-bottom") : $('#row2').removeClass("border-bottom");
    }

    // Sets active menu on scroll based on visible section of page
    function setActiveMenu() {
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

    // Shows and hides lesson description
    function toggleLessonDescription() {
        $('#lessons ul li').bind("mouseenter", function () {
            $(this).find('div.description').delay(200).fadeIn();
        });

        $('#lessons ul li').bind("mouseleave", function () {
            $(this).find('div.description').stop(true).fadeOut();
        });
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
        $('#joinbox').hide();
        $('#loginbox').animate({
                height: 'toggle'
            }, 300
        );

        ev.stopPropagation();
    });

    $('#joinbtn').click(function (ev) {
        $('#loginbox').hide();
        $('#joinbox').animate({
                height: 'toggle'
            }, 300
        );

        ev.stopPropagation();
    })

    $('.cancel').click(function (ev) {
        ev.preventDefault();

        $(ev.target).parents('.winbox').animate({
                height: 'hide'
            }, 300
        );
    })

    $(document).scroll(function () {
        addBorderBottom();
        setActiveMenu();
    });
    toggleLessonDescription();

});