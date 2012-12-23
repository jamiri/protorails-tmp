$(document).ready(function() {
    //---------------------------------------------set menu items active on scroll-to-----------------------------
    $(document).scroll(function () {

        $('a.nav').each(function () {

            var divTop = $('#' + this.title).offset().top;
            var top = $("body").scrollTop() > 0 ? $("body").scrollTop() : $("html").scrollTop();
            var distance = divTop - top;

            if (distance > 150 && distance < 300) {

                $('a.active').removeClass('active');
                $(this).addClass('active');

            }
        });
    });
    //---------------------------------------------set menu items active on scroll-to-----------------------------

    //----------------------------------smooth scrolling for navigation menu----------------------------------
    $('a.nav').click(function (ev) {
        ev.preventDefault();

        $('html, body').animate({
            scrollTop:$('#' + this.title).offset().top - 215
        }, 2000, 'easeOutQuint');

        $('a.active').removeClass();
        $(this).addClass('active');
    });
    //----------------------------------smooth scrolling for navigation menu----------------------------------

    //---------------------------------------------scroll down signing forms --------------------------------------
    $('#signing .btn').click(function(ev) {
        var btn_id = $(ev.target).attr('id');
        var box_id = btn_id.substr(0, btn_id.length - 3) + 'box';

        $('.winbox:visible').animate({
                height: 'toggle'
            }, 300
        );

        $('#' + box_id).animate({
                height: 'toggle'
            }, 300
        );

        ev.stopPropagation();
    });

//    $('#loginbtn').click(function(ev) {
//        $('#sign-up').hide();
//        $('#sign-in').animate({
//                height: 'toggle'
//            }, 300
//        );
//
//        ev.stopPropagation();
//    });
//
//
//    $('#joinbtn').click(function(ev) {
//        $('#sign-in').hide();
//        $('#sign-up').animate({
//                height: 'toggle'
//            }, 300
//        );
//
//        ev.stopPropagation();
//    });

    $('.cancel').click(function(ev) {
        ev.preventDefault();
        $(ev.target).parents('.winbox').animate({
                height: 'toggle'
            }, 300
        );
    });

    $('body').click(function() {
        $('#sign-in').animate({
                height: 'hide'
            }, 300
        );
        $('#sign-up').animate({
                height: 'hide'
            }, 300
        );
    });

    $('.winbox').click(function(event){
        event.stopPropagation();
    });

    $('body').keydown(function (keyEvent) {

        if (keyEvent.keyCode === 27) { // escape
            $('#sign-in').animate({
                    height: 'hide'
                }, 300
            );
            $('#sign-up').animate({
                    height: 'hide'
                }, 300
            );
        }
    });
    //---------------------------------------------scroll down signing forms --------------------------------------

    //----------------------------------show and hide lesson details on hover----------------------------------
    $('#lessons ul li').bind("mouseover", function () {
        $(this).find('div.description').css("visibility", "visible");
    });

    $('#lessons ul li').bind("mouseout", function () {
        $(this).find('div.description').css("visibility", "hidden");
    });
    //----------------------------------show and hide lesson details on hover----------------------------------

    //----------------------------------show and hide lesson podcast----------------------------------
    $('div.description span a').bind("click", function () {
        $('div#player').css("display", "table");
    });

    $('a#close_player').bind("click", function () {
        $('div#player').css("display", "none");
    });
    //----------------------------------show and hide lesson podcast----------------------------------

    //---------------------------------- tab function in category section----------------------------------
    $(function () {
        var items = $('#tabs>li').each(function () {
            $(this).click(function () {
                //remove previous class and add it to clicked tab
                items.removeClass('current');
                $(this).addClass('current');
            });
        });
    });
    //---------------------------------- tab function in category section----------------------------------

    //---------------------------------------------show and hide sign-up form----------------------------------
    $('a.join').click(function () {
        $('#sign-in').attr('display', 'none');
        $('#join').attr('display', 'none');
        $('#sign-up').attr('display', 'block');
    });

    $('button#joincancel').click(function () {
        $('#sign-up').attr('display', 'none');
        $('#sign-in').attr('display', 'table-cell');
        $('#join').attr('display', 'block');
    });
    //---------------------------------------------show and hide sign-up form----------------------------------
});