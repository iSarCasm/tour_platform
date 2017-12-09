# == Schema Information
#
# Table name: tour_excursions
#
#  id                 :integer          not null, primary key
#  ticket_operator_id :integer
#  active_tour_id     :integer
#  ticket_date        :datetime
#  stock              :integer
#  adult_buy          :decimal(, )
#  adult_sell         :decimal(, )
#  senior_buy         :decimal(, )
#  senior_sell        :decimal(, )
#  child_buy          :decimal(, )
#  child_sell         :decimal(, )
#  infant_buy         :decimal(, )
#  infant_sell        :decimal(, )
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  excursion_id       :integer
#

class TourExcursion < ApplicationRecord
  belongs_to :ticket_operator
  belongs_to :active_tour, inverse_of: :tour_excursions
  belongs_to :excursion
  has_many :notes, as: :noteable
end
