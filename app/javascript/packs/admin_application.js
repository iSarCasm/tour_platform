import 'stylesheets/jquery-seat-plan'
import '../sass/admin/admin_application'

import 'jquery'
import 'moment/src/moment'
import 'javascript/jquery.livestamp'
import 'javascript/jquery.timer'
import 'javascript/jquery.notificationcenter'

import 'jquery-ujs'

$(document).ready(function() {
  $.get("/admin/admin_alert.json", function(data, status){
    var alerts = data;
    var notifs = []

    // console.log(alerts);

    alerts.forEach(function(alert) {
      var notif = {
        type: 'system',
        values:[{
          text: {
            text: alert.content,
            title: alert.title
          },
          id: alert.id,
          time: 100,
          callback: function(notif) {
            setTimeout(function() {
              updateNotifCounter();
            }, 100);
            markAlertAsRead(notif.id);
          },
          new: true
        }]
      };
      notifs.push(notif);
    });

    $('body').notificationcenter({
      center_element: "#notificationcenterpanel",
      body_element: "#rails-admin-wrapper",
      toggle_button: "#js-alerts-toggle",
      offset_top: 60,
      remove_animation: true,
      counter: 0,
      add_panel: true,
      default_notifs: notifs
    });

    updateNotifCounter();
  });
});

function markAlertAsRead(id) {
  $.ajax({
    url: 'admin_alert/'+ id + '/edit.js', // your api url
    method: 'PUT', // method is any HTTP method
    format: 'js',
    data: {admin_alert: {read: true}}, // data as js object
    success: function(data) {
      console.log(data);
    }
  });
}

function updateNotifCounter() {
  $('#notif-counter').text($.notificationcenter.notifCount());
}

function getAlerts() {
  $.get("admin_alert.json", function(data, status){
    alerts = filterAlerts(data);
    addAlertsToAlertSystem(alerts);
    updateNotifCounter();
  });
}

function addAlertsToAlertSystem(alerts) {
  // $.notificationcenter.newAlert({'text':'New alert by button click.', 'title':$(this).attr('data-type')}, $(this).attr('data-type'));
}
