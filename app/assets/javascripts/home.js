var urls = {
    latest_lessons: '/lessons/latest',
    mostpop_lessons: '/lessons/mostpop'
};

var actionHandler = {
    '#lessons .latest': { click: loadLatestLessons },
    '#lessons .hottest': { click: loadMostPopularLessons }
};

$(document).ready(function() {
    // ---- define button actions
    $.each(actionHandler, function(k, v) {
        $(k).bind(v);
    });

    loadLatestLessons();

    $(document).scroll(globals.setActiveMenu)
});

function loadLatestLessons(ev) {
    $('#lesson_view').empty().toggleClass('ajax_loader');
    $.getJSON(urls.latest_lessons, function(data) {
        var src = $('#lesson-template').html();
        var template = Handlebars.compile(src);

        $('#lesson_view').toggleClass('ajax_loader');

        $('#lesson_view').append(template(data));

        globals.toggleLessonDescription();
    });
}

function loadMostPopularLessons(ev) {
    $('#lesson_view').empty().toggleClass('ajax_loader');

    $.getJSON(urls.mostpop_lessons, function(data) {
        var src = $('#lesson-template').html();
        var template = Handlebars.compile(src);

        $('#lesson_view').toggleClass('ajax_loader');

        $('#lesson_view').empty().append(template(data));

        globals.toggleLessonDescription();
    });
}


