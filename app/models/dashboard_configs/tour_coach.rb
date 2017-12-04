# == Schema Information
#
# Table name: tour_coaches
#
#  id             :integer          not null, primary key
#  coach_id       :integer
#  active_tour_id :integer
#  departure_date :datetime
#  arrival_date   :datetime
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  driver_name    :string
#  driver_number  :string
#  seatplan_id    :integer
#  rate           :decimal(, )
#  vehicle_reg    :string
#  pickup_list_id :integer
#

RailsAdmin.config do |config|
  config.model TourCoach do
    parent Coach

    list do
      field :id
      field :coach do
        eager_load true
      end
      field :active_tour do
        eager_load true
      end
      field :departure_date
      field :arrival_date
      field :driver_name
      field :notes
      field :rate
      field :seatplan
      field :coach_bookings_count do
        label 'Orders'
      end
      field :pickup_list do
        eager_load true
      end
    end

    update { set_template 'tour_coaches' }
    create { set_template 'tour_coaches' }
    edit do
      field :coach, :filter_select_with_defaults
      field :active_tour
      field :departure_date
      field :arrival_date
      field :driver_name
      field :driver_number
      field :vehicle_reg
      field :notes do
        html_attributes rows: 10, cols: 100
      end
      field :amenities
      field :seatplan
      field :seat_prices do
        render do
          bindings[:view].render(
            partial: 'table_edit',
            locals: {
              field: self,
              form: bindings[:form],
              table_headers: ['char', 'price'],
              style: 'width: auto;',
              links_css: 'col-sm-offset-2'
            }
          )
        end
      end
      field :pickup_list
      field :rate
    end

    show do
      set_template 'tour_coaches_show'

      field :id
      field :coach
      field :active_tour
      field :departure_date
      field :arrival_date
      field :driver_name
      field :driver_number
      field :vehicle_reg
      field :notes
      field :amenities
      field :seatplan do
        pretty_value do
          bindings[:view].render(
            partial: 'rails_admin/seatplan_show',
            locals: { seatplan: bindings[:object].seatplan }
          )
        end
      end
      field :seat_prices do
        pretty_value do
          bindings[:view].render(
            partial: 'rails_admin/table_show',
            locals: {
              objects: bindings[:object].seat_prices,
              table_headers: ['char', 'price'],
              methods: [:char, :price]
            }
          )
        end
      end
      field :pickup_list
      field :rate
      field :created_at
      field :updated_at
    end
  end
end
