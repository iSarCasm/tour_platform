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
  items.push([ 'f', 'unavailable', 'Already Booked'])
  return items
}

function updateSelectedSeatsField(ids) {
  $('#tour_booking_coach_bookings_attributes_0_seats')[0].value = JSON.stringify(ids)
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
      },
    },
    legend : {
      node : $('#legend'),
        items : legendItems()
    },
    click: function () {
      if (this.status() == 'available' && this.data().is_seat) {
        //let's create a new <li> which we'll add to the cart items
        $('<li>'+this.data().category+' Seat # '+this.settings.label+': <b>$'+this.data().price+'</b> <a href="#" class="cancel-cart-item">[cancel]</a></li>')
          .attr('id', 'cart-item-'+this.settings.id)
          .data('seatId', this.settings.id)
          .appendTo($cart);

        /*
         * Lets update the counter and total
         *
         * .find function will not find the current seat, because it will change its stauts only after return
         * 'selected'. This is why we have to add 1 to the length and the current seat price to the total.
         */
        $counter.val(sc.find('selected').length+1);
        var newPrice = recalculateTotal(sc)+parseInt(this.data().price);
        $total.text("$" + parseInt(newPrice).toFixed(2));

        setTimeout(function() {
          updateSelectedSeatsField(sc.find('selected').seatIds)
        }, 100)

        return 'selected';
      } else if (this.status() == 'selected') {
        //update the counter
        $counter.text(sc.find('selected').length-1);
        //and total
        $total.text(recalculateTotal(sc)-parseInt(this.data().price));

        //remove the item from our cart
        $('#cart-item-'+this.settings.id).remove();
        //seat has been vacated
        return 'available';
      } else if (this.status() == 'unavailable') {
        //seat has been already booked
        return 'unavailable';
      } else {
        return this.style();
      }
    }
  });

  //this will handle "[cancel]" link clicks
  $('#selected-seats').on('click', '.cancel-cart-item', function (e) {
    e.preventDefault()
    //let's just trigger Click event on the appropriate seat, so we don't have to repeat the logic here
    sc.get($(this).parents('li:first').data('seatId')).click();
  });

  //let's pretend some seats have already been booked
  sc.get(gon.reserved_seats).status('unavailable');

});

function recalculateTotal(sc) {
  var total = 0;
  //basically find every selected seat and sum its price
  sc.find('selected').each(function () {
    total += parseInt(this.data().price);
  });
  console.log(total)
  return total;
}
;
