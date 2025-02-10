$ (function(){

     let flexContainer = $('div.flex-container');
     let searchBox = $('.search-box');
     let searchClose = $('.search-icon-close');

    $('.menu-icon, .menu-icon-close').click(function (e){
        e.preventDefault();
        e.stopPropagation();
    });

    function hideLayer(){
        flexContainer.removeClass('opaque');
    }

});