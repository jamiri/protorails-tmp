function showNotification(options) {
    $(document).ready(function () { setTimeout(function(){
        $().toastmessage('showToast', $.extend({
            text:'put something here',
            type:'notice',
            position:'top-center',
            stayTime:5000
        }, options));
    }, 1000);
    });
}
