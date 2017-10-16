# == Schema Information
#
# Table name: coaches
#
#  id            :integer          not null, primary key
#  title         :string
#  description   :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  address       :text
#  phone         :string
#  fax           :string
#  website       :text
#  email         :string
#  contact_name  :string
#  mobile_number :string
#  notes         :text
#  seatplan_id   :integer
#

class Coach < ApplicationRecord
  has_many :tour_coaches, dependent: :destroy, inverse_of: :coach

  # Defaults
  belongs_to :seatplan, inverse_of: :coaches, optional: true
  has_many :seat_prices, dependent: :destroy, inverse_of: :coach

  accepts_nested_attributes_for :seat_prices, allow_destroy: true

  validates :title, presence: true

  def tour_coaches_count
    tour_coaches.count
  end
end
