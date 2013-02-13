var routes = {
    latest_lessons: 'lessons/latest',
    mostpop_lessons: 'lessons/mostpop',
    latest_questions: 'questions/latest',
    mostpop_questions: 'questions/mostpop',
    latest_discussions: 'discussions/latest',
    latest_suggestions: 'suggestions/latest'
};

var hashEvents = {};

$(document).ready(function() {
    $(document).scroll(globals.setActiveMenu);

    loadLatestLessons();
    loadLatestQuestions();
    loadLatestDiscussions();
    loadLatestSuggestions();

    $('#lessons .latest').click(loadLatestLessons);
    $('#lessons .hottest').click(loadMostPopularLessons);
    $('#Questions .latest').click(loadLatestQuestions);
    $('#Questions .hottest').click(loadMostPopularQuestions);
    $('#Discussions .latest').click(loadLatestDiscussions);
    $('#suggestions .latest').click(loadLatestSuggestions);

    $('a[href=""]').click(function(ev) {
        ev.preventDefault();
    });
});

function loadLatestLessons() {
    var $viewElem = $('#lesson_view')

    $viewElem.empty().toggleClass('ajax_loader');

    $.getJSON(routes.latest_lessons, function(data) {
        var src = $('#lesson-template').html();
        var template = Handlebars.compile(src);

        $viewElem.toggleClass('ajax_loader');

        $viewElem.append(template(data));

        globals.toggleLessonDescription();
    });
}

function loadMostPopularLessons() {
    var $viewElem = $('#lesson_view')

    $viewElem.empty().toggleClass('ajax_loader');

    $.getJSON(routes.mostpop_lessons, function(data) {
        var src = $('#lesson-template').html();
        var template = Handlebars.compile(src);

        $viewElem.toggleClass('ajax_loader');

        $viewElem.empty().append(template(data));

        globals.toggleLessonDescription();
    });
}

function loadLatestQuestions() {
    var $viewElem = $('#question_view');

    $viewElem.empty().toggleClass('ajax_loader');

    $.getJSON(routes.latest_questions, function(data) {
        var src = $('#question-template').html();
        var template = Handlebars.compile(src);

        $viewElem.toggleClass('ajax_loader');

        $viewElem.append(template(data));

        globals.toggleLessonDescription();
    });
}

function loadMostPopularQuestions() {
    var $viewElem = $('#question_view');

    $viewElem.empty().toggleClass('ajax_loader');

    $.getJSON(routes.mostpop_questions, function(data) {
        var src = $('#question-template').html();
        var template = Handlebars.compile(src);

        $viewElem.toggleClass('ajax_loader');

        $viewElem.append(template(data));

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
    });
}

function loadLatestSuggestions() {
    var $viewElem = $('#suggestion_view');

    $viewElem.empty().toggleClass('ajax_loader');

    $.getJSON(routes.latest_suggestions, function(data) {
        console.log(data);
        var src = $('#suggestion-template').html();
        var template = Handlebars.compile(src);

        $viewElem.toggleClass('ajax_loader');

        $viewElem.append(template(data));
    });
}