//= require toastr
//= require jquery-seat-plan

//= require jquery.livestamp
//= require jquery.timer
//= require jquery.notificationcenter

$(document).ready(function() {
  toastr.options = {
    "closeButton": true,
    "debug": false,
    "newestOnTop": true,
    "progressBar": true,
    "positionClass": "toast-top-right",
    "preventDuplicates": false,
    "onclick": null,
    "showDuration": "300",
    "hideDuration": "1000",
    "timeOut": "10000",
    "extendedTimeOut": "1000",
    "showEasing": "swing",
    "hideEasing": "linear",
    "showMethod": "fadeIn",
    "hideMethod": "fadeOut"
  }
  // toastr.info('Welcome to the Admin Dashboard')

  // Table view ADD button hack
  var oldNestedFormEvents = window.nestedFormEvents.insertFields
  window.nestedFormEvents.insertFields = function (content, assoc, link) {
    console.log(content);
    var insertable = $(link).siblings('table').find('.js-insertable');
    if (insertable.length > 0) {
      insertable.first().append(content);
      return insertable.first().children().last();
    } else {
      return oldNestedFormEvents(content, assoc, link);
    }
  }
});
