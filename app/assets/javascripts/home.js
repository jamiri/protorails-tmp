var routes = {
    latest_lessons: 'lessons/latest',
    mostpop_lessons: 'lessons/mostpop',
    latest_questions: 'questions/latest',
    mostpop_questions: 'questions/mostpop',
    latest_discussions: 'discussions/latest'
};

$(document).ready(function() {
    $(document).scroll(globals.setActiveMenu);

    loadLatestLessons();
    loadLatestQuestions();
    loadLatestDiscussions();

    routie(routes.latest_lessons, loadLatestLessons);
    routie(routes.mostpop_lessons, loadMostPopularLessons);
    routie(routes.latest_questions, loadLatestQuestions);
    routie(routes.mostpop_questions, loadMostPopularQuestions);
    routie(routes.latest_discussions, loadLatestDiscussions);

    $('a[href="#"]').click(function(ev) {
        ev.preventDefault();
    });
});

function loadLatestLessons() {
    $('#lesson_view').empty().toggleClass('ajax_loader');

    $.getJSON(routes.latest_lessons, function(data) {
        var src = $('#lesson-template').html();
        var template = Handlebars.compile(src);

        $('#lesson_view').toggleClass('ajax_loader');

        $('#lesson_view').append(template(data));

        globals.toggleLessonDescription();
    });
}

function loadMostPopularLessons() {
    $('#lesson_view').empty().toggleClass('ajax_loader');

    $.getJSON(routes.mostpop_lessons, function(data) {
        var src = $('#lesson-template').html();
        var template = Handlebars.compile(src);

        $('#lesson_view').toggleClass('ajax_loader');

        $('#lesson_view').empty().append(template(data));

        globals.toggleLessonDescription();
    });
}

function loadLatestQuestions() {
    $('#question_view').empty().toggleClass('ajax_loader');

    $.getJSON(routes.latest_questions, function(data) {
        var src = $('#question-template').html();
        var template = Handlebars.compile(src);

        $('#question_view').toggleClass('ajax_loader');

        $('#question_view').append(template(data));

        globals.toggleLessonDescription();
    });
}

function loadMostPopularQuestions() {
    $('#question_view').empty().toggleClass('ajax_loader');

    $.getJSON(routes.mostpop_questions, function(data) {
        var src = $('#question-template').html();
        var template = Handlebars.compile(src);

        $('#question_view').toggleClass('ajax_loader');

        $('#question_view').append(template(data));

        globals.toggleLessonDescription();
    });
}

function loadLatestDiscussions() {
    var $viewElem = $('#discussion_view');

    $viewElem.empty().toggleClass('ajax_loader');

    $.getJSON(routes.latest_discussions, function(data) {
        var src = $('#discussion-template').html();
        var template = Handlebars.compile(src);

        $viewElem.toggleClass('ajax_loader');

        $viewElem.append(template(data));

        console.log(data);
    });
}
