require 'rails_helper'

describe BookingWizard::Step1 do
  let(:subject) { BookingWizard::Step1.new(params: params, session: session) }
  let(:session) { nil }
  let(:params) { ActionController::Parameters.new({ active_tour_slug: 'abc' }) }

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
    let!(:tour) { create :tour }
    let!(:active_tour) { create :active_tour, slug: 'abc', tour: tour }

    it 'assigns #booking' do
      expect(subject.booking).to be_a TourBooking
    end

    describe 'assigns #active_tour' do
      it 'finds by slug' do
        expect(subject.active_tour).to eq active_tour
      end

      it 'configures for form'
    end

    it 'assigns #tour' do
      expect(subject.tour).to eq active_tour.tour
    end
  end

  describe '#save' do
    let!(:active_tour) { create :active_tour }
    let(:params) do 
      ActionController::Parameters.new({
        tour_booking: {
          active_tour_id: active_tour.id,
          adult: 2,
          child: 1,
          infant: 3,
          senior: 4
        },
        hotel_booking: {
          13 => 2,
          9 => 1,
          4 => 3
        }
      })
    end

    describe 'adds tour_booking to #attributes hash' do
      it 'initializes from params' do
        stub_step_initialize
        
        subject.save
  
        expect(subject.attributes[:tour_booking].active_tour_id).to eq active_tour.id
        expect(subject.attributes[:tour_booking].adult).to eq 2
        expect(subject.attributes[:tour_booking].child).to eq 1
        expect(subject.attributes[:tour_booking].infant).to eq 3
        expect(subject.attributes[:tour_booking].senior).to eq 4
      end
    end

    describe 'adds hotel_bookings to #attributes hash' do
      xit 'initializes N bookings for each hotel' do
        stub_step_initialize

        subject.save

        expect(subject.attributes[:hotel_bookings]).to match_array([
          HotelBooking.new(tour_booking: subject.attributes[:tour_booking], hotel_room_id: 13),
          HotelBooking.new(tour_booking: subject.attributes[:tour_booking], hotel_room_id: 13),
          HotelBooking.new(tour_booking: subject.attributes[:tour_booking], hotel_room_id: 9),
          HotelBooking.new(tour_booking: subject.attributes[:tour_booking], hotel_room_id: 4),
          HotelBooking.new(tour_booking: subject.attributes[:tour_booking], hotel_room_id: 4),
          HotelBooking.new(tour_booking: subject.attributes[:tour_booking], hotel_room_id: 4)
        ])
      end
    end
  end

  def stub_step_initialize
    allow_any_instance_of(BookingWizard::Step1)
      .to receive(:step_initialize)
  end
end