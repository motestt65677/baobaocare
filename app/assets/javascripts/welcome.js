$( document ).ready(function() {
    $(window).scroll(function() {
     var hT = $('#scroll-to-1').offset().top,
         hH = $('#scroll-to-1').outerHeight(),
         wH = $(window).height(),
         wS = $(this).scrollTop();
     if (wS > (hT+hH-wH)){
        var scroll = document.getElementById("scroll-to-1")
        var element = document.getElementById("move-1")
        element.classList.add("float-up");
     }
    });

    $(window).scroll(function() {
     var hT = $('#scroll-to-2').offset().top,
         hH = $('#scroll-to-2').outerHeight(),
         wH = $(window).height(),
         wS = $(this).scrollTop();
     if (wS > (hT+hH-wH)){
        var element = document.getElementById("move-2")
        element.classList.add("float-up");
     }
    });

    $(window).scroll(function() {
     var hT = $('#scroll-to-3').offset().top,
         hH = $('#scroll-to-3').outerHeight(),
         wH = $(window).height(),
         wS = $(this).scrollTop();
     if (wS > (hT+hH-wH)){
        var element = document.getElementById("move-3")
        element.classList.add("float-up");
     }
    });
});
