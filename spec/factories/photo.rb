FactoryGirl.define do
  factory :hotel_photo, class: 'Photo' do
    photo { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'images', 'img1.jpg'), 'image/jpg') }
    association :photoable, :factory => :hotel
  end
end
