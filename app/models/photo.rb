# == Schema Information
#
# Table name: photos
#
#  id             :integer          not null, primary key
#  photo          :string
#  photoable_id   :integer
#  photoable_type :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Photo < ApplicationRecord
  belongs_to :photoable, polymorphic: true

  mount_uploader :photo, PhotosUploader

  validates :photo, presence: true

  rails_admin do
    weight 100
    list do
      field :id
      field :thumb, :carrierwave
      field :file_size
      field :updated_at
      field :created_at
    end
    edit do
      field :photo, :carrierwave
    end
  end

  def thumb
    photo.thumb
  end

  def file_size
    ActionController::Base.helpers.number_to_human_size photo.file.size
  end
end
