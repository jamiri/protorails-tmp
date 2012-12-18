$(document).ready(function() {

     var sign_up_form_options = {
        success: function() {
            $('#sign_up_form_wrapper').hide();
            $('#sign_up_thanks').show();
            $('#mask, .window').delay(800).fadeOut(200);
        }
    };

//    $('#sign_up_form').ajaxForm(sign_up_form_options);

    var sign_up_validator = new FormValidator('sign_up_form', [{
        name: 'user[name]',
        display: 'name',
        rules: 'required'
    }, {
        name: 'user[mail_address]',
        display: 'email address',
        rules: 'required|valid_email'
    }, {
        name: 'user[password]',
        display: 'password',
        rules: 'required'
    }, {
        name: 'user[password_confirmation]',
        display: 'password confirmation',
        rules: 'required|matches[user[password]]'
    }], function (errors, ev) {
        ev.preventDefault();

        $('#sign_up_form input').removeClass('invalid');
        $('#dialog_sign_up .errors-wrapper').empty().hide();

        if (errors.length > 0) {
            var messages = $('<ul>');

            $(errors).each(function() {
                $('#' + this.id).addClass('invalid');
                messages.append($('<li>').html(this.message));
            });

            $('#dialog_sign_up .errors-wrapper').append(messages).show();

            return;
        }

        $(ev.target).ajaxSubmit(sign_up_form_options);
    });
});