$(document).ready(function(){
    $(window).resize( function() {
        windowWidth = $(window).width();
        if (windowWidth > 580) {
            $('#nav-list').show();
        }
        else {
            $('#nav-list').hide();
        }
    });
    $('#menu-icon').on("click", function() {
        $('#nav-list').toggle();
    });
}); 