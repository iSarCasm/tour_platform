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

  def thumb
    photo.thumb
  end

  def file_size
    ActionController::Base.helpers.number_to_human_size photo.file.size
  end
end
