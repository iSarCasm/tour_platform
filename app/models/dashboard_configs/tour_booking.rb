# == Schema Information
#
# Table name: tour_bookings
#
#  id               :integer          not null, primary key
#  active_tour_id   :integer
#  user_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  adult            :integer
#  child            :integer
#  infant           :integer
#  senior           :integer
#  agent_commission :decimal(, )      default(0.0)
#  cost_commission  :decimal(, )      default(0.0)
#  vat_rate         :decimal(, )      default(0.0)
#  deposit          :decimal(, )      default(0.0)
#  paid             :decimal(, )      default(0.0)
#  agent_paid       :boolean          default(FALSE)
#

RailsAdmin.config do |config|
  config.model TourBooking do
    list do
      field :id
      field :active_tour
      field :user do
        label 'Booked by'
      end
      field :created_at do
        label 'Booked on'
      end
      field :adult
      field :child
      field :infant
      field :senior
    end

    show do
      set_template 'tour_booking_show'
      field :active_tour
      field :user
      field :created_at
      field :adult
      field :child
      field :infant
      field :senior
      field :total_cost
      field :agent_commission
      field :cost_commission
      field :vat_rate
      field :deposit
      field :paid
      field :remaining
      field :agent_paid
      field :coach_booking
      field :hotel_bookings
      field :created_at
      field :updated_at
    end

    create { set_template 'tour_booking' }
    update { set_template 'tour_booking' }

    edit do
      field :active_tour
      field :user
      field :adult
      field :child
      field :infant
      field :senior
      field :total_cost
      field :agent_commission
      field :cost_commission
      field :vat_rate
      field :deposit
      field :paid
      field :remaining
      field :agent_paid
    end
  end
end
