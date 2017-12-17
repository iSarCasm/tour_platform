# == Schema Information
#
# Table name: tour_bookings
#
#  id             :integer          not null, primary key
#  active_tour_id :integer
#  user_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  adult          :integer
#  child          :integer
#  infant         :integer
#  senior         :integer
#

RailsAdmin.config do |config|
  config.model TourBooking do
    list do
      field :active_tour
      field :user
      field :created_at
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
    end
  end
end
