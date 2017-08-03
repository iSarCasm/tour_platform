class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :tour_bookings, dependent: :destroy, inverse_of: :user
  belongs_to :role, inverse_of: :users, optional: true

  validates :name, presence: true

  enum base_role: [:customer, :admin]

  rails_admin do
    list do
      exclude_fields :created_at, :updated_at
    end
    edit do
      exclude_fields :tour_bookings
    end
  end
end
