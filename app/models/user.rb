# == Schema Information
#
# Table name: users
#
#  id                                :integer          not null, primary key
#  name                              :string
#  created_at                        :datetime         not null
#  updated_at                        :datetime         not null
#  email                             :string           default(""), not null
#  encrypted_password                :string           default(""), not null
#  reset_password_token              :string
#  reset_password_sent_at            :datetime
#  remember_created_at               :datetime
#  sign_in_count                     :integer          default(0), not null
#  current_sign_in_at                :datetime
#  last_sign_in_at                   :datetime
#  current_sign_in_ip                :inet
#  last_sign_in_ip                   :inet
#  base_role                         :integer          default("customer")
#  role_id                           :integer
#  title                             :string
#  address                           :string
#  postcode                          :string
#  passport_name                     :string
#  passport_no                       :string
#  date_of_birth                     :date
#  phone_mobile                      :string
#  phone_landline                    :string
#  phone_evening                     :string
#  kin_name                          :string
#  kin_phone                         :string
#  travel_club                       :boolean
#  member_no                         :string
#  first_name                        :string
#  last_name                         :string
#  marketing_email                   :boolean
#  marketing_sms                     :boolean
#  marketing_phone                   :boolean
#  marketing_postal                  :boolean
#  passport_expiry                   :date
#  gender_id                         :integer
#  notes                             :text
#  may_expand_more_with_full_contact :boolean
#  client_unsuitable_for_travel      :boolean
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :tour_bookings, dependent: :destroy, inverse_of: :user
  has_many :admin_alerts, dependent: :destroy, inverse_of: :user
  belongs_to :role, inverse_of: :users, optional: true
  belongs_to :gender, inverse_of: :users, optional: true
  has_many :notes, as: :noteable, inverse_of: :user

  validates :name, presence: true

  enum base_role: [:customer, :admin]

  def total_spent
    tour_bookings.reduce(0) { |sum, t| sum + t.total_cost }
  end

  def last_travelled
    tour_bookings.sort_by(&:end_date).last
  end
end
