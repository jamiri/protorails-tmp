var commentFormHandler = function (e) {
    e.preventDefault();

    var commentElem = $('.comment_post.proto').clone().removeClass('proto');
    commentElem.find('.id')
        // TODO: should be fixed.
        .html("__user_name__")
        .end()
        .find('p')
        .html($(this).find('textarea[name="comment[body]"]').val());

    $(this).ajaxSubmit();

    $(this).before(commentElem);

    $(this).find('textarea[name="comment[body]"]').val('')
};


$(document).ready(function () {
    // enable comment dialogs for microblogs
    $('.microblog_comment').dialog({
        autoOpen:false,
        width:600
    });

    $('.post .comments a').click(function (ev) {
        ev.preventDefault();
        $($(this).attr('href')).dialog('open');
    });

    // Ajaxify the comment forms
    $('.blog_post_comment_form').submit(commentFormHandler);

    // init auto scrolling for microblogs
    if (microblog_pagination) {
        initInfiniScroll($('.MicroBlog').get(0), function (page) {
            return "/lesson/" + $('.script:first').attr('lesson_id') + "/microblogs/" + page;
        }, function (data) {
            $(data).each(function () {

                // DOM element for BlogPost
                var blogElem = $('.post.proto').clone().removeClass('proto').show()
                    .find('h2')
                    .html(this.title)
                    .end()
                    .find('.date')
                    .html('posted on ' + new Date(this.posted_on).strftime('%B %d, %Y'))
                    .end()
                    .find('.comments a')
                    .attr('href', "#dialog" + this.id)
                    .html(this.comments.length > 0 ?
                    this.comments.length + " comment(s)" :
                    "Post a new comment")
                    .click(function (ev) {
                        ev.preventDefault();
                        $($(this).attr('href')).dialog('open');
                    })
                    .end()
                    .find('p')
                    .html(this.content)
                    .end();

                // DOM element for BlogPost's comments window
                var commentsWindow = $('.microblog_comment.proto').clone().removeClass('proto').hide()
                    .attr('id', "dialog" + this.id)
                    .attr('title', "Comments on " + this.title)
                    .appendTo(blogElem)
                    // the dialog call must be at the end of the chain.
                    .dialog({
                        autoOpen:false,
                        width:600
                    });

                if (this.comments.length > 0) {
                    $(this.comments).each(function () {

                        // DOM element for a single comment
                        $('.comment_post.proto').clone().removeClass('proto')
                            .find('.id')
                            .html(this.user.name)
                            .end()
                            .find('p')
                            .html(this.comment)
                            .end()
                            .appendTo(commentsWindow);
                    });
                }

                // DOM element for a single comment form
                $('.blog_post_comment_form.proto').clone().removeClass('proto')
                    .find('input[name="comment[blog_post_id]"]').val(this.id)
                    .end()
                    .submit(commentFormHandler)
                    .appendTo(commentsWindow);

                blogElem.appendTo($('.MicroBlog'))
            });
        });
    }
});