# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  base_role              :integer          default("customer")
#  role_id                :integer
#  title                  :string
#  address                :string
#  postcode               :string
#  passport_name          :string
#  passport_no            :string
#  passport_date_of_birth :date
#  phone_mobile           :string
#  phone_landline         :string
#  phone_evening          :string
#  marketing              :boolean
#  kin_name               :string
#  kin_phone              :string
#  travel_club            :boolean
#  member_no              :string
#

RailsAdmin.config do |config|
  config.model User do
    list do
      exclude_fields :created_at, :updated_at
    end

    edit do
      exclude_fields :tour_bookings, :admin_alerts
    end

    show do
      field :name
      field :email
      field :base_role
      field :role_id
      field :title
      field :address
      field :postcode
      field :passport_name
      field :passport_no
      field :passport_date_of_birth
      field :phone_mobile
      field :phone_landline
      field :phone_evening
      field :marketing
      field :kin_name
      field :kin_phone
      field :travel_club
      field :member_no
      field :total_spent
      field :last_travelled do
        pretty_value do
          value.active_tour_title
        end
      end
      field :tour_bookings do
        pretty_value do
          bindings[:view].render(
            partial: 'rails_admin/table_show',
            locals: {
              objects: bindings[:object].tour_bookings,
              table_headers: ['Tour', 'Start date', 'End date', 'Price'],
              methods: [:tour_title, :start_date, :end_date, :total_cost]
            }
          )
        end
      end
    end
  end
end
