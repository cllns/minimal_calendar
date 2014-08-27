$(function() {
  var hash = window.location.hash;
  $(hash).addClass('highlighted');

  $('.datepicker').pickadate({
    format: 'mmm dd, yyyy',
    formatSubmit: 'yyyy-mm-dd',
    hiddenName: true,
    editable: true,
    min: true // sets today as the minimum date
  });

  $('.timepicker').pickatime({
    interval: 15,
    formatSubmit: 'HH:i',
    editable: true,
    hiddenName: true
  });

  // We persist the form's visibility
  // (the cookie is updated when the form's visibility is toggled)
  if ($.cookie('show-add-event-form')) {
    $('.new-event').slideDown('fast');
  }

  $('.toggle-event').click(function() {
    $('.new-event').slideToggle('fast', function() {
      $link = $('.toggle-event a');
      new_text = $link.data('toggled-text');
      old_text = $link.html();

      $link.html(new_text);
      $link.data('toggled-text', old_text);

      // update the cookie
      $.cookie('show-add-event-form', $('.new-event').is(':visible'));
    });
  });
});
