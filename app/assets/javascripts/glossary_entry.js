$(document).ready(function () {

        // get the lesson id from lesson_id attribute of an element with "lesson_script" id
        var lesson_id = $("#lesson_script").attr("lesson_id");

        // get all the words with their respective meanings from the server in Json format
        $.getJSON("/lesson/" + lesson_id + "/terms", addTags);

        $('#play_pronun').click(function(e){
            e.preventDefault();

            $('#term_pronun').get(0).play();
        })

        $('#glossary_dialog .close').click(function(e) {
            $('#term_pronun').get(0).pause();
        })

        $('#mask').click(function(e) {
            $('#term_pronun').get(0).pause();
        })
    }

);

// TODO: needs refactoring. Escaping should be done on the server-side.
function htmlEntities(str) {
    return String(str).replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;');
}

function addTags(data) {

    $(data).each(function() {
        replaceTerm($("#lesson_script_body"), this);
    });

    $(".glossary_entry").tipTip({defaultPosition:"top"});

    $('.glossary_entry').click(function(e) {
        e.preventDefault();

        $.getJSON($(this).attr('href') + '.json', function(data) {
            var gd = $('#glossary_dialog');

            gd.find('#term_name').html(data.name);

            if (data.full_definition != null) {
                gd.find('#term_full_def').html(data.full_definition);
            } else {
                gd.find('#term_full_def').html(data.short_definition);
            }

            if (data.pronun_file) {
                gd.find('#term_pronun')
                    .empty()
                    .append(
                        $('<source>')
                            .attr('type', 'audio/mpeg')
                            .attr('src', '/assets/' + data.pronun_file)
                    );

                gd.find('#play_pronun').show();
            } else {
                gd.find('#play_pronun').hide();
            }

            if (data.image_file) {
                gd.find('#term_image').attr('src', '/assets/' + data.image_file).show();
            } else {
                gd.find('#term_image').hide();
            }

            if (data.ext_link) {
                gd.find('#term_link_wrapper').show();
                gd.find('#term_link').attr('href', data.ext_link).html(data.ext_link);
            } else {
                gd.find('#term_link_wrapper').hide();
            }

            showModal($('#glossary_dialog'));
        });
    });
}

function replaceTerm(elem, ge) {
    if (!elem || elem.length == 0) { return; }

    if (elem.nodeType === 3) {
        $(elem).replaceWith(function() {

            return this.nodeValue.replace(new RegExp(["(\\s)", "(", ge.name, ")", "(\\s)"].join(''), "ig"),

                function(match, p1, p2, p3) {
                    var aElem = $('<a>')
                        .addClass('glossary_entry')
                        .attr('href', '/glossary/' + ge.name)
                        .attr('title', htmlEntities(ge.short_definition))
                        .html(p2);

                    return [p1, aElem.prop('outerHTML'), p3].join('');
                }
            );
        });

        return;
    }

    if (!(elem instanceof jQuery)) { elem = $(elem) }

    elem.contents().filter(function() {
        return this.nodeType === 3 || (this.nodeType === 1 && this.tagName.toLowerCase() != "a");
    }).each(function() {
            replaceTerm(this, ge);
    });
}