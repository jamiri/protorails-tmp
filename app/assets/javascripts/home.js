var urls = {
    latest_lessons: '/lessons/latest',
    mostpop_lessons: '/lessons/mostpop'
};

$(document).ready(function() {
    // ---- define button actions
    $('#lessons .latest').click(function(ev) {
        ev.preventDefault();
        loadLatestLessons();
    });

    $('#lessons .hottest').click(function(ev) {
        ev.preventDefault();
        loadMostPopularLessons();
    });

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

        $('html, body').stop(true).animate({
            scrollTop:$('#' + this.title).offset().top - 215
        }, 1500, 'easeOutExpo');

        $('a.active').removeClass();
        $(this).addClass('active');
    });
    //----------------------------------smooth scrolling for navigation menu----------------------------------

    //---------------------------------------------scroll down signing forms --------------------------------------
    $('#loginbtn').click(function(ev) {
        $('#joinbox').hide();
        $('#loginbox').animate({
                height: 'toggle'
            }, 300
        );

        ev.stopPropagation();
    });

    $('#joinbtn').click(function(ev) {
        $('#loginbox').hide();
        $('#joinbox').animate({
                height: 'toggle'
            }, 300
        );

        ev.stopPropagation();
    });

    $('.cancel').click(function(ev) {
        ev.preventDefault();

        $(ev.target).parents('.winbox').animate({
                height: 'hide'
            }, 300
        );
    });

    $('.winbox').click(function(event){
        event.stopPropagation();
    });

    $('body').click(function() {
        hideWinboxes();
    });

    $('body').keydown(function (keyEvent) {

        if (keyEvent.keyCode === 27) { // escape
            hideWinboxes();
        }
    });
    //---------------------------------------------scroll down signing forms --------------------------------------

    //---------------------------------- tab function in category section----------------------------------
    var items = $('#tabs>li').click(function (ev) {
            items.removeClass('current');
            $(this).addClass('current');
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

function hideWinboxes() {
    $('.winbox:visible').animate({
            height: 'hide'
        }, 300
    );
}

function enableLessonHovers() {
    //----------------------------------show and hide lesson details on hover----------------------------------
    $('#list_of_lessons li')
        .bind("mouseover", function () {
            $(this).find('div.description').css("visibility", "visible");
        })
        .bind("mouseout", function() {
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
}

function loadLatestLessons() {
    $.getJSON(urls.latest_lessons, function(data) {
        var src = $('#lesson-template').html();
        var template = Handlebars.compile(src);

        $('#list_of_lessons').empty().append(template(data));

        enableLessonHovers();
    });
}

function loadMostPopularLessons() {
    $.getJSON(urls.mostpop_lessons, function(data) {
        var src = $('#lesson-template').html();
        var template = Handlebars.compile(src);

        $('#list_of_lessons').empty().append(template(data));

        enableLessonHovers();
    });
}