# == Schema Information
#
# Table name: tours
#
#  id           :integer          not null, primary key
#  title        :string
#  description  :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  slug         :string
#  tour_type_id :integer
#  country_id   :integer
#

class Tour < ApplicationRecord
  has_many :active_tours, dependent: :destroy, inverse_of: :tour
  belongs_to :tour_type, inverse_of: :tours, optional: true
  belongs_to :country, inverse_of: :tours, optional: true

  accepts_nested_attributes_for :active_tours, allow_destroy: true

  validates :title, presence: true

  extend FriendlyId
  friendly_id :title, use: :slugged
end
