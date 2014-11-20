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
    formatSubmit: 'HH:i EST',
    editable: true,
    hiddenName: true
  });

  function swap_toggle_form_text() {
      $link = $('.toggle-event a');
      new_text = $link.data('toggled-text');
      old_text = $link.html();

      $link.html(new_text);
      $link.data('toggled-text', old_text);
  }
  // We persist the form's visibility
  // (the cookie is updated when the form's visibility is toggled)
  if ($.cookie('show-add-event-form') === "true") {
    // cookie only store strings, hence    ^^^^
    $('.new_event').show();
    swap_toggle_form_text();
  }

  $('.toggle-event').click(function() {
    $('.new_event').slideToggle('fast', function() {
      swap_toggle_form_text();
      // update the cookie
      $.cookie('show-add-event-form', $('.new_event').is(':visible'));
    });
  });
});
