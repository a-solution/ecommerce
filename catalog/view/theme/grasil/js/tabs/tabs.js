(function( $ ) {
  $.fn.basicTabs = function(options){
    var settings = $.extend({
      active_class: "current",
      list_class: "tabs",
      content_class: "tab_content",
      starting_tab: 1
    }, options );
    var $content = $('.' + settings.content_class);
    var $list = $('.' + settings.list_class);
    $content.find(' > div').hide();
    $content.find("div:nth-child(" + settings.starting_tab + ")").show();
    $list.find("li:nth-child(" + settings.starting_tab + ")").addClass(settings.active_class);
    
    $($list.find("li:nth-child(" + settings.starting_tab + ")").find('a').attr('href') +' .bxslider').bxSlider({
        minSlides: 1,
        maxSlides: 5,
        slideWidth: 175,
        slideMargin: 5,
        pager: false,        
        auto: false,
        stopAuto: false
    });

    $("." + settings.list_class + ' li a').click(function(e){
        $list.find("li").removeClass(settings.active_class);
        $("." + settings.content_class + " > div").hide();
        $(this).parent().addClass(settings.active_class);
        var currentTab = $(this).attr('href');
        $(currentTab).show();        
        $(currentTab + ' .bxslider').bxSlider({
            minSlides: 1,
            maxSlides: 5,
            slideWidth: 175,
            slideMargin: 5,
            pager: false,        
            auto: false,
            stopAuto: false
        });
        
        e.preventDefault();
    });
  };
}( jQuery ));


