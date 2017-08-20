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

$(document).ready(function() {
  var $cart = $('#selected-seats'),
    $counter = $('.js-seats').first(),
    $total = $('#coach-subtotal'),
    sc = $('#seat-map').seatCharts({
    map: fetchedSeatplan(),
    seats: {
      f: {
        price   : 100,
        classes : 'first-class', //your custom CSS class
        category: 'First Class'
      },
      e: {
        price   : 40,
        classes : 'economy-class', //your custom CSS class
        category: 'Economy Class'
      }

    },
    naming : {
      top : false,
      getLabel : function (character, row, column) {
        return firstSeatLabel++;
      },
    },
    legend : {
      node : $('#legend'),
        items : [
        [ 'f', 'available',   'First Class' ],
        [ 'e', 'available',   'Economy Class'],
        [ 'f', 'unavailable', 'Already Booked']
        ]
    },
    click: function () {
      if (this.status() == 'available') {
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
        var newPrice = recalculateTotal(sc)+this.data().price;
        $total.text("$" + newPrice.toFixed(2));

        return 'selected';
      } else if (this.status() == 'selected') {
        //update the counter
        $counter.text(sc.find('selected').length-1);
        //and total
        $total.text(recalculateTotal(sc)-this.data().price);

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
  $('#selected-seats').on('click', '.cancel-cart-item', function () {
    //let's just trigger Click event on the appropriate seat, so we don't have to repeat the logic here
    sc.get($(this).parents('li:first').data('seatId')).click();
  });

  //let's pretend some seats have already been booked
  sc.get(['1_2', '4_1', '7_1', '7_2']).status('unavailable');

});

function recalculateTotal(sc) {
  var total = 0;
  //basically find every selected seat and sum its price
  sc.find('selected').each(function () {
    total += this.data().price;
  });
  return total;
}
;