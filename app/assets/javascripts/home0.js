var urls = {
    latest_lessons: '/lessons/latest',
    mostpop_lessons: '/lessons/mostpop'
};

var actionHandler = {

    '#lessons .latest': { click: loadLatestLessons },

    '#lessons .hottest': { click: loadMostPopularLessons },

    'a.nav': { click: smoothScroll },

    '#loginbtn': { click: clickLoginBtn },

    '#joinbtn': { click: clickJoinBtn },

    '.cancel': { click: clickCancelBtn },

    'body': { click: hideWinboxes, keydown: keydownBody }
};

$(document).ready(function() {

    // ---- define button actions
    $.each(actionHandler, function(k, v) {
        $(k).bind(v);
    });

    //done
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

    //done
    $('.winbox').click(function(event){
        event.stopPropagation();
    });

    //done
    //---------------------------------- tab function in category section----------------------------------
    var items = $('#tabs>li').click(function (ev) {
            items.removeClass('current');
            $(this).addClass('current');
    });
    //---------------------------------- tab function in category section----------------------------------

    //done
    //---------------------------------------------show and hide sign-up form----------------------------------
    $('a.join').click(function () {
        $('#sign-in').attr('display', 'none');
        $('#join').attr('display', 'none');
        $('#sign-up').attr('display', 'block');
    });

    //done
    $('button#joincancel').click(function () {
        $('#sign-up').attr('display', 'none');
        $('#sign-in').attr('display', 'table-cell');
        $('#join').attr('display', 'block');
    });
    //---------------------------------------------show and hide sign-up form----------------------------------

    loadLatestLessons();

});

//done
function hideWinboxes() {
    $('.winbox:visible').animate({
            height: 'hide'
        }, 300
    );
}

// renamed to toggleLessonDescription
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

// shall stay here
function loadLatestLessons(ev) {
    $('#lesson_view').empty().toggleClass('ajax_loader');

    $.getJSON(urls.latest_lessons, function(data) {
        var src = $('#lesson-template').html();
        var template = Handlebars.compile(src);

        $('#lesson_view').toggleClass('ajax_loader');

        $('#lesson_view').append(template(data));

        enableLessonHovers();
    });
}

// shall stay here
function loadMostPopularLessons(ev) {
    $('#lesson_view').empty().toggleClass('ajax_loader');

    $.getJSON(urls.mostpop_lessons, function(data) {
        var src = $('#lesson-template').html();
        var template = Handlebars.compile(src);

        $('#lesson_view').toggleClass('ajax_loader');

        $('#lesson_view').empty().append(template(data));

        enableLessonHovers();
    });
}

//----------------------------------smooth scrolling for navigation menu----------------------------------
function smoothScroll(ev) {
    ev.preventDefault();

    $('html, body').stop(true).animate({
        scrollTop:$('#' + this.title).offset().top - 215
    }, 1500, 'easeOutExpo');

    $('a.active').removeClass();
    $(this).addClass('active');
}

function clickLoginBtn(ev) {
    $('#joinbox').hide();
    $('#loginbox').animate({
            height: 'toggle'
        }, 300
    );

    ev.stopPropagation();
}

function clickJoinBtn(ev) {
    $('#loginbox').hide();
    $('#joinbox').animate({
            height: 'toggle'
        }, 300
    );

    ev.stopPropagation();
}

function clickCancelBtn(ev) {
    ev.preventDefault();

    $(ev.target).parents('.winbox').animate({
            height: 'hide'
        }, 300
    );
}

function keydownBody(ev) {
    if (ev.keyCode === 27) { // escape
        hideWinboxes();
    }
}