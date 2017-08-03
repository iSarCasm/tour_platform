class HotelFacility < ApplicationRecord
  belongs_to :hotel
  belongs_to :facility

  rails_admin do
    hide
  end
end
