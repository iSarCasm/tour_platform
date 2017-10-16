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
      exclude_fields :created_at, :updated_at
    end
  end
end
