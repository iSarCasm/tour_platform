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
#  excursions            :text
#  itinerary             :text
#  important_notes       :text
#  tour_memo             :text
#  other_costs           :decimal(, )
#  self_drive            :boolean
#  allow_deposits        :boolean
#  allow_external_agents :boolean
#  insurance_allowed     :boolean
#

class Tour < ApplicationRecord
  has_many :active_tours, dependent: :destroy, inverse_of: :tour
  belongs_to :tour_type, inverse_of: :tours, optional: true
  belongs_to :country, inverse_of: :tours, optional: true
  has_many :tour_categories, dependent: :destroy
  has_many :categories, through: :tour_categories

  accepts_nested_attributes_for :active_tours, allow_destroy: true

  validates :title, presence: true

  extend FriendlyId
  friendly_id :title, use: :slugged
end
