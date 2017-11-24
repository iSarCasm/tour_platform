class ExcursionTour < ApplicationRecord
  belongs_to :excursion
  belongs_to :tour
end
