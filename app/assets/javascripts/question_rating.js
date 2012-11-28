/**
 * Created with JetBrains RubyMine.
 * User: mhasani
 * Date: 8/29/12
 * Time: 2:22 PM
 * To change this template use File | Settings | File Templates.
 */

function question_vote(question_id, amnt, enabled) {
    if (enabled && eval("question_" + question_id + "_not_rated") && user_connected) {
        $.ajax({
            type:"GET",
            url:"/lesson/" + $('.script:first').attr('lesson_id') + "/question/" + question_id + "/rating/" + amnt,
            dataType:"json",
            success:function (amnt) {
                $("#current-rating-question" + question_id).width(amnt * 25);
                showNotification({
                    text:"You have Rate this Question successfully.",
                    type:"notice"
                });
             }
        });
    }
    if (!user_connected) {
        showNotification({
            text:"You are not logged,please Log in before Question Rating.",
            type:"error"
        })
    }
    else if (!eval("question_" + question_id + "_not_rated")) {
        showNotification({
            text:"You already rated this Question.",
            type:"error"
        });
    }
    eval("question_" + question_id + "_not_rated = false");
}