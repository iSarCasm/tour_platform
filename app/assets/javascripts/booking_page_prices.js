$(document).ready(function() {
  var adult = $('.js-adult')[0];
  var child = $('.js-child')[0];
  var infant = $('.js-infant')[0];
  var senior = $('.js-senior')[0];

  var updateSeats = function() {
    $('.js-seats').first().val(
      parseInt(adult.value) + parseInt(child.value) + parseInt(infant.value) + parseInt(senior.value)
    );
  }

  var updatePrice = function() {
    var totalPrice = 0.00;
    $('.js-hotel-room option:selected').each(function() {
      var room_price = 0;
      room_price += adult.value * parseInt($(this).data('price-adult'));
      room_price += child.value * parseInt($(this).data('price-child'));
      room_price += infant.value * parseInt($(this).data('price-infant'));
      room_price += senior.value * parseInt($(this).data('price-senior'));
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
