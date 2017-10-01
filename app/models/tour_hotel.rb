# == Schema Information
#
# Table name: tour_hotels
#
#  id                :integer          not null, primary key
#  hotel_id          :integer
#  active_tour_id    :integer
#  start_date        :date
#  end_date          :date
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  board_basis_id    :integer
#  payment_type_id   :integer
#  finalisation_date :datetime
#  hotel_theme       :string
#  notes             :text
#

class TourHotel < ApplicationRecord
  has_many :hotel_rooms, dependent: :destroy, inverse_of: :tour_hotel
  belongs_to :hotel, inverse_of: :tour_hotels
  belongs_to :active_tour, inverse_of: :tour_hotels
  belongs_to :board_basis, inverse_of: :tour_hotels, optional: true
  belongs_to :payment_type, inverse_of: :tour_hotels, optional: true

  validates :hotel, :active_tour, presence: true

  accepts_nested_attributes_for :hotel_rooms, allow_destroy: true

  rails_admin do
    parent Hotel

    update do
      set_template 'tour_hotels'
    end

    edit do
      field :hotel do
        eager_load true
      end
      field :active_tour
      field :start_date
      field :end_date
      field :board_basis
      field :payment_type
      field :finalisation_date
      field :hotel_theme
      field :hotel_rooms do
        render do
          bindings[:view].render(
            partial: 'table_edit',
            locals: {
              field: self,
              form: bindings[:form],
              table_headers: [
                'Amount', 'Room Type', 'Adult', 'Adult supp',
                'Child', 'Child supp', 'Infant', 'Infant supp',
                'Senior', 'Senior supp'
              ]
            }
          )
        end
      end
      field :notes
    end

    show do
      field :hotel
      field :active_tour
      field :start_date
      field :end_date
      field :board_basis
      field :payment_type
      field :finalisation_date
      field :hotel_theme
      field :hotel_rooms do
        pretty_value do
          bindings[:view].render(
            partial: 'rails_admin/table_show',
            locals: {
              objects: bindings[:object].hotel_rooms,
              table_headers: [
                'Amount', 'Room Type', 'Adult', 'Adult supp',
                'Child', 'Child supp', 'Infant', 'Infant supp',
                'Senior', 'Senior supp'
              ],
              methods: [
                :amount, :room_type, :adult, :adult_supp,
                :child, :child_supp, :infant, :infant_supp,
                :senior, :senior_supp
              ]
            }
          )
        end
      end
      field :notes
    end

    list do
      field :id
      field :hotel
      field :active_tour
      field :start_date
      field :end_date
      field :board_basis
      field :payment_type
      field :finalisation_date
      field :hotel_rooms_count do
        label 'Hotel room types'
      end
    end
  end

  def title
    "#{hotel_title} [#{booking_period}]"
  rescue
    'New Tour Hotel'
  end

  def hotel_title
    hotel.title
  end

  def photos
    hotel.photos
  end

  def hotel_rooms_count
    hotel_rooms.count
  end

  def booking_period
    "#{start_date.to_formatted_s(:rfc822)} - #{end_date.to_formatted_s(:rfc822)}"
  end

  def booking_period_fancy
    "#{start_date.strftime("%d %B")} - #{end_date.strftime("%d %B")}"
  end

  def available?
    hotel_rooms.any? { |r| r.available? }
  end

  def days
    nights + 1
  end

  def nights
    (end_date - start_date).to_i
  end
end
