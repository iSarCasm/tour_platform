# == Schema Information
#
# Table name: tours
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  slug        :string
#

class Tour < ApplicationRecord
  has_many :active_tours, dependent: :destroy, inverse_of: :tour

  accepts_nested_attributes_for :active_tours, allow_destroy: true

  validates :title, presence: true

  rails_admin do
    edit do
      field :title
      field :description
      field :active_tours do
        eager_load true
      end
    end

    list do
      field :id
      field :title
      field :description
      field :active_tours do
        eager_load true
      end
    end
  end

  extend FriendlyId
  friendly_id :title, use: :slugged
end
