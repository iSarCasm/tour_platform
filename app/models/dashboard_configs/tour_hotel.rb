# == Schema Information
#
# Table name: tour_hotels
#
#  id                :integer          not null, primary key
#  hotel_id          :integer
#  active_tour_id    :integer
#  start_date        :date
#  end_date          :date
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  board_basis_id    :integer
#  payment_type_id   :integer
#  finalisation_date :datetime
#  hotel_theme       :string
#

RailsAdmin.config do |config|
  config.model TourHotel do
    parent Hotel

    update { set_template 'tour_hotels' }
    create { set_template 'tour_hotels' }
    edit do
      field :hotel, :filter_select_with_defaults
      field :active_tour
      field :start_date
      field :end_date
      field :board_basis
      field :payment_type
      field :finalisation_date
      field :hotel_theme
      field :hotel_rooms do
        render do
          bindings[:view].render(
            partial: 'table_edit',
            locals: {
              field: self,
              form: bindings[:form],
              table_headers: [
                'Amount', 'Room Type',
                'Adult Buy', 'Adult Sell', 'Adult supp',
                'Senior Buy', 'Senior Sell', 'Senior supp',
                'Child Buy', 'Child Sell',
                'Infant Buy', 'Infant Sell'
              ]
            }
          )
        end
      end
      field :notes
    end

    show do
      set_template 'tour_hotels_show'

      field :hotel
      field :active_tour
      field :start_date
      field :end_date
      field :board_basis
      field :payment_type
      field :finalisation_date
      field :hotel_theme
      field :hotel_rooms do
        pretty_value do
          bindings[:view].render(
            partial: 'rails_admin/table_show',
            locals: {
              objects: bindings[:object].hotel_rooms,
              table_headers: [
                'Amount', 'Room Type',
                'Adult Buy', 'Adult Sell', 'Adult supp',
                'Senior Buy', 'Senior Sell', 'Senior supp',
                'Child Buy', 'Child Sell',
                'Infant Buy', 'Infant Sell'
              ],
              methods: [
                :amount, :room_type,
                :adult_buy, :adult_sell, :adult_supp,
                :senior_buy, :senior_sell, :senior_supp, :child_buy, :child_sell,
                :infant_buy, :infant_sell
              ]
            }
          )
        end
      end
      field :hotel_rooms_bookings
      field :notes
    end

    list do
      field :id
      field :hotel
      field :active_tour
      field :start_date
      field :end_date
      field :board_basis
      field :payment_type
      field :finalisation_date
      field :hotel_rooms_count do
        label 'Hotel room types'
      end
    end
  end
end
