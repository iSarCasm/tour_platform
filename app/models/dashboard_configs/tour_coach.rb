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
      field :seatplan
      field :coach_bookings_count do
        label 'Orders'
      end
      field :pickup_list do
        eager_load true
      end
    end

    edit do
      field :coach
      field :active_tour
      field :departure_date
      field :arrival_date
      field :driver_name
      field :driver_number
      field :notes
      field :coach_amenities
      field :seatplan
      field :seat_prices
      field :pickup_list
    end

    show do
      field :id
      field :coach
      field :active_tour
      field :departure_date
      field :arrival_date
      field :driver_name
      field :driver_number
      field :notes
      field :coach_amenities
      field :seatplan do
        pretty_value do
          bindings[:view].render(
            partial: 'rails_admin/seatplan_show',
            locals: { seatplan: bindings[:object].seatplan }
          )
        end
      end
      field :seat_prices
      field :pickup_list
      field :created_at
      field :updated_at
      exclude_fields :tour_coach_amenities
    end
  end
end
