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
});
