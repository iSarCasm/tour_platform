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
