function refreshCaptcha() {
    $.getJSON("/captcha.json", function (data) {
        var src = $("#captcha-template").html();
        var template = Handlebars.compile(src);
        var newSrc = template(data);
        $("#captcha-div").html(newSrc).hide().fadeIn(700);
    });
}