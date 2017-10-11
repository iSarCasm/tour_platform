# == Schema Information
#
# Table name: coaches
#
#  id            :integer          not null, primary key
#  title         :string
#  description   :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  address       :text
#  phone         :string
#  fax           :string
#  website       :text
#  email         :string
#  contact_name  :string
#  mobile_number :string
#  notes         :text
#  seatplan_id   :integer
#

require 'rails_helper'

describe Coach do
  describe '#tour_coaches_count' do
    it 'returns count of associated tour_coaches' do
      coach = create :coach
      create_list :tour_coach, 3, coach: coach

      expect(coach.tour_coaches_count).to eq 3
    end
  end
end
