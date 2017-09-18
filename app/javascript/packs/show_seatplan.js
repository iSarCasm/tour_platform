import 'javascript/jquery-seat-plan'

var firstSeatLabel = 1;

function fetchedSeatplan() {
  var map = [""]
  var i = 0
  var seatplan = gon.seatplan
  for (var x = 0; x < seatplan.length; x++) {
    var c = seatplan.charAt(x)
    if (c === "\n") {
      i++
      map[i] = ""
    } else {
      map[i] = map[i] + c
    }
  }
  return map
}

function legendItems() {
  var items = []
  $.each(gon.seat_types, function(char, seat) {
    if (char !== '_')
      items.push([char, 'available', seat["category"]])
  })
  items.push([ 'f', 'unavailable', 'Booked seat'])
  return items
}

$(document).ready(function() {
  var $cart = $('#selected-seats'),
    $counter = $('.js-seats').first(),
    $total = $('#coach-subtotal'),
    sc = $('#seat-map').seatCharts({
    map: fetchedSeatplan(),
    seats: gon.seat_types,
    naming : {
      top : false,
      getLabel : function (character, row, column, settings) {
        return (settings.seats[character].is_seat ? firstSeatLabel++ : '');
      }
    },
    legend : {
      node : $('#legend'),
        items : legendItems()
    }
  });

  // Reserved seats
  sc.get(gon.reserved_seats).status('unavailable');
});
