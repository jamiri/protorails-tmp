/**
 * Created with JetBrains RubyMine.
 * User: mhasani
 * Date: 8/29/12
 * Time: 2:22 PM
 * To change this template use File | Settings | File Templates.
 */
function vote(amnt) {
    if (!lesson_voted && user_connected) {
        $.ajax({
            type:"GET",
            url:$('.script:first').attr('lesson_id') + "/rating/" + amnt,
            dataType:"json",
            success:function (amnt) {
                $('#current-rating').width(amnt * 25);
                lesson_voted = true;
                showNotification({
                    text:"You have Rate this Lesson successfully.",
                    type:"notice"
                });
            }
        });
    }
    else if (!user_connected) {
        showNotification({
            text:"You are not logged in, please Log in before Lesson Rating.",
            type:"error"
        });
    }
    else if (lesson_voted) {
        showNotification({
            text:"You already rated this Lesson.",
            type:"error"
        });
    }
}
