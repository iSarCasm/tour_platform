$(document).ready(function() {
  var adult = $('.js-adult')[0];
  var child = $('.js-child')[0];
  var infant = $('.js-infant')[0];
  var senior = $('.js-senior')[0];

  var updateSeats = function() {
    $('.js-seats').first().val(
      parseInt(adult.value, 10) + parseInt(child.value, 10) + parseInt(infant.value, 10) + parseInt(senior.value, 10)
    );
  }

  var updatePrice = function() {
    var totalPrice = 0.00;
    $('.js-hotel-room option:selected').each(function() {
      var room_price = 0;
      room_price += adult.value * parseInt($(this).data('price-adult'), 10);
      room_price += child.value * parseInt($(this).data('price-child'), 10);
      room_price += infant.value * parseInt($(this).data('price-infant'), 10);
      room_price += senior.value * parseInt($(this).data('price-senior'), 10);
      $(this).closest('.js-hotel-booking').find('.js-subtotal').text(
        '$' + room_price.toFixed(2)
      )

      totalPrice += room_price;
    })
    $('#js-total-price').text(
      '$' + totalPrice.toFixed(2)
    );
  }

  var updateSeatsAndPrice = function() {
    // updateSeats();
    updatePrice();
  }

  updateSeatsAndPrice();

  $('.js-adult').on('change', updateSeatsAndPrice);
  $('.js-child').on('change', updateSeatsAndPrice);
  $('.js-infant').on('change', updateSeatsAndPrice);
  $('.js-senior').on('change', updateSeatsAndPrice);
});
