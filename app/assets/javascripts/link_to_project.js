(function($) {
  'use strict';

  $(document).ready(function() {
    console.log($(this).data('link'));
    $(document).on('click', '.project-item',  function() {
      console.log($(this).data('link'));
      window.location.href = $(this).data('link');
    });
  });
}(jQuery));