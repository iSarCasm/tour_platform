var map = {};
var marker;
var activePoint;
function initMap() {
  var mapAnchor = document.getElementById("google-map");
  var lat = $(mapAnchor).data('lat');
  var lng = $(mapAnchor).data('lng');
  var myOptions = {
    zoom: 18,
    center: new google.maps.LatLng(lat, lng),
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    scrollwheel: false
  };
  map = new google.maps.Map(mapAnchor, myOptions);
  marker = new google.maps.Marker({
    position: new google.maps.LatLng(lat, lng),
    map: map
  });
}

function selectPoint(point) {
  if (activePoint)
    activePoint.removeClass('active')

  activePoint = $(point)
  $(point).addClass('active')
  var lat = $(point).data('lat')
  var lng = $(point).data('lng')
  marker.setPosition(new google.maps.LatLng(lat, lng));
  map.setCenter(new google.maps.LatLng(lat, lng));
}

$(document).ready(function() {
  initMap();
  $('.js-pickup-point').on('click', function(e) {
    e.preventDefault()
    selectPoint(this)
  })
});
