// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require highcharts
//= require yui/yahoo-dom-event.js
//= require yui/calendar.js
//= require_tree .


(function($) {
  var Samofund = {};

  Samofund.secondaryNav = {
    display: function(settingLink) {
      var nav = settingLink.parent();
      nav.find('ul.sub').toggle();
      settingLink.toggleClass('pop');
    },
    hide: function() {
      var settingLink = $('nav.sec a');
      var nav = settingLink.parent();
      nav.find('ul.sub').hide();
      settingLink.removeClass('pop');
    }
  };

  /* Pressing ESC or click on html region */
  function hidePopover() {
    Samofund.secondaryNav.hide();
    $('ul.filter .popover').hide();
  }

  $('body').keydown(function(evt) {
    if (event.keyCode == 27) {
      hidePopover()
      evt.preventDefault();
    }
  });

  $('html').click(function(evt) {
    hidePopover()
  });

  /* Flash message */
  $('.flash').delay(800).slideDown("fast");
  $('.flash').live("click", function() {
    $(this).fadeOut("fast");
  });

  /* Sub-menu */
  $('header#masthead nav li').hover(
    function() { $(this).find('ul.sub').show(); },
    function() { $(this).find('ul.sub').hide(); }
  );

  /* Secondary nav - logout, settings, etc */
  $('nav.sec > a').click(function(evt) {
    Samofund.secondaryNav.display($(this));
    evt.preventDefault();
    evt.stopPropagation(); // prevent html click from getting it
  });

  /* Filter bar popover */
  $('ul.filter li.pop').live("click", function(evt) {
    $(this).find('.popover').show();
  });

})(jQuery);