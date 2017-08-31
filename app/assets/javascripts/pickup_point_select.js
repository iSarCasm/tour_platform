var map = {};
var marker;
var activePoint;
function initMap() {
  var lat = 10
  var lng = 10
  var myOptions = {
    zoom: 18,
    center: new google.maps.LatLng(lat, lng),
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    scrollwheel: false
  };
  map = new google.maps.Map(document.getElementById("google-map"), myOptions);
  marker = new google.maps.Marker({
    position: new google.maps.LatLng(lat, lng),
    map: map
  });

  points = document.getElementsByClassName('js-pickup-point')
  selectPoint(points[0])
}

function selectPoint(point) {
  console.log(point)
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
  $('.js-pickup-point').on('click', function(e) {
    e.preventDefault()
    selectPoint(this)
  })
});
