# == Schema Information
#
# Table name: tours
#
#  id                    :integer          not null, primary key
#  title                 :string
#  description           :text
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  slug                  :string
#  tour_type_id          :integer
#  country_id            :integer
#  itinerary             :text
#  tour_memo             :text
#  other_costs           :decimal(, )
#  self_drive            :boolean
#  allow_deposits        :boolean
#  allow_external_agents :boolean
#  insurance_allowed     :boolean
#

class Tour < ApplicationRecord
  belongs_to :tour_type, inverse_of: :tours, optional: true
  belongs_to :country, inverse_of: :tours, optional: true

  has_many :active_tours, dependent: :destroy, inverse_of: :tour
  has_many :tour_categories, dependent: :destroy
  has_many :categories, through: :tour_categories
  has_many :excursion_tours, dependent: :destroy
  has_many :excursions, through: :excursion_tours
  has_many :notes, as: :noteable

  accepts_nested_attributes_for :active_tours, allow_destroy: true

  validates :title, presence: true

  extend FriendlyId
  friendly_id :title, use: :slugged
end
