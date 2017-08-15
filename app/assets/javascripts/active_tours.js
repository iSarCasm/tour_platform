// Price watcher
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
      totalPrice += adult.value * parseInt($(this).data('price-adult'));
      totalPrice += child.value * parseInt($(this).data('price-child'));
      totalPrice += infant.value * parseInt($(this).data('price-infant'));
      totalPrice += senior.value * parseInt($(this).data('price-senior'));
    })
    $('.js-total-price').first().text(
      '$' + totalPrice.toFixed(2)
    );
  }

  var updateSeatsAndPrice = function() {
    updateSeats();
    updatePrice();
  }

  updateSeatsAndPrice();

  $('.js-adult').on('change', updateSeatsAndPrice);
  $('.js-child').on('change', updateSeatsAndPrice);
  $('.js-infant').on('change', updateSeatsAndPrice);
  $('.js-senior').on('change', updateSeatsAndPrice);
});
