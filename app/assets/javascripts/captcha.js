function refreshCaptcha() {
    var currCaptcha = $('#captcha-div img');

    currCaptcha.animate({
        opacity: 0.3
    }, 300);

    $.getJSON("/captcha.json", function (data) {
        var src = $("#captcha-template").html();
        var template = Handlebars.compile(src);
        var newSrc = template(data);
        var srcDom = $(newSrc);

        srcDom.eq(0).css('opacity', 0).load(function() {
            currCaptcha.animate({
                opacity: 0
            }, 250, function() {
                $("#captcha-div").html(srcDom);

                $(this).animate({
                    opacity: 1
                }, 250);

            }.bind(this));
        });
    });
}