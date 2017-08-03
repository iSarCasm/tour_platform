class AddPaymentTypeToTourHotel < ActiveRecord::Migration[5.1]
  def change
    add_reference :tour_hotels, :payment_type, foreign_key: true
  end
end
