# == Schema Information
#
# Table name: coaches
#
#  id               :integer          not null, primary key
#  title            :string
#  description      :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  address          :text
#  phone_number     :string
#  fax_number       :string
#  website          :text
#  email            :string
#  contact_name     :string
#  emergency_number :string
#  seatplan_id      :integer
#  rating           :decimal(, )
#

require 'rails_helper'

describe Coach do
  describe '#tour_coaches_count' do
    it 'returns count of associated tour_coaches' do
      coach = build :coach
      create_list :tour_coach, 3, coach: coach

      expect(coach.tour_coaches_count).to eq 3
    end
  end
end
