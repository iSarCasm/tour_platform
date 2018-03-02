require 'rails_helper'

describe BookingWizard::Step1 do
  let(:subject) { BookingWizard::Step1.new(params: params, session: session) }
  let(:session) { nil }
  let(:params) { { active_tour_slug: 'abc' } }

  describe '#view' do
    it 'returns path to view file' do
      stub_step_initialize

      expect(subject.view).to eq 'tour_bookings/booking_wizard/step1'
    end
  end

  describe '#next_step_path' do
    it do
      create :active_tour, slug: 'abc'

      expect(subject.next_step_path).to eq '/abc?step=2'
    end
  end

  describe '#step_initalize' do
    it 'assigns #booking'

    describe 'assigns #active_tour' do
      it 'finds by slug'

      it 'configures for form'
    end

    it 'assigns #tour'
  end

  describe '#save' do
    it 'adds tour_booking to #attributes hash'

    it 'adds hotel_bookings to #attributes hash'
  end

  def stub_step_initialize
    allow_any_instance_of(BookingWizard::Step1)
      .to receive(:step_initialize)
  end
end