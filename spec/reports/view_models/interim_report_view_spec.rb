require 'rails_helper'

require_dependency Rails.root.join('app', 'reports', 'view_models', 'interim_report_view')

describe InterimReportView do
  def report(tour_hotel)
    InterimReportView.for(tour_hotel: tour_hotel)
  end

  describe '#for' do
    describe ':bookings_grouped_by_room_type' do
      context 'tour hotel without bookings' do
        it 'is empty' do
          tour_hotel = create :tour_hotel
          expect(report(tour_hotel)[:bookings_grouped_by_room_type]).to eq []
        end
      end

      context 'tour hotel with bunch of bookings' do
        before do
          tour_hotel = create :tour_hotel
          @room_type_1 = create :room_type, room_type: 'Single'
          @room_type_2 = create :room_type, room_type: 'Double'
          hotel_room_1 = create(
            :hotel_room,
            tour_hotel: tour_hotel,
            room_type: @room_type_1
          )
          hotel_room_2 = create(
            :hotel_room,
            tour_hotel: tour_hotel,
            room_type: @room_type_2
          )
          @hotel_booking_1 = create :hotel_booking, hotel_room: hotel_room_1
          @hotel_booking_2 = create :hotel_booking, hotel_room: hotel_room_1
          @hotel_booking_3 = create :hotel_booking, hotel_room: hotel_room_2
          @hotel_booking_4 = create :hotel_booking, hotel_room: hotel_room_2
          @hotel_booking_5 = create :hotel_booking, hotel_room: hotel_room_2
          @report_view = report(tour_hotel)
        end

        it 'is an array of groups' do
          expect(@report_view[:bookings_grouped_by_room_type]).to eq [
            {
              type: @room_type_1,
              bookings: [@hotel_booking_1, @hotel_booking_2]
            }, {
              type: @room_type_2,
              bookings: [@hotel_booking_3, @hotel_booking_4, @hotel_booking_5]
            }
          ]
        end
      end
    end

    describe ':hotel_title' do
      it 'returns hotel title' do
        hotel = create :hotel, title: 'Mega Hotel'
        tour_hotel = build :tour_hotel, hotel: hotel

        expect(report(tour_hotel)[:hotel_title]).to eq 'Mega Hotel'
      end
    end

    describe ':board_basis' do
      it 'returns title of associated board basis' do
        board_basis = create :board_basis, title: 'The Title'
        tour_hotel = build :tour_hotel, board_basis: board_basis

        expect(report(tour_hotel)[:board_basis]).to eq 'The Title'
      end
    end

    describe ':arrival_date' do
      it 'returns arrival date in a pretty form' do
        tour_hotel = build :tour_hotel, end_date: Time.zone.parse('2014-10-19 1:00:00')

        expect(report(tour_hotel)[:arrival_date]).to eq '19-OCT-2014'
      end
    end

    describe ':departure_date' do
      it 'returns departure date in a pretty form' do
        tour_hotel = build :tour_hotel, start_date: Time.zone.parse('2015-10-12 1:00:00')

        expect(report(tour_hotel)[:departure_date]).to eq '12-OCT-2015'
      end
    end

    describe ':nights' do
      it 'returns nights in a tour hotel' do
        tour_hotel = build :tour_hotel, start_date: Time.zone.parse('2014-10-12 1:00:00'), end_date: Time.zone.parse('2014-10-19 1:00:00')

        expect(report(tour_hotel)[:nights]).to eq 7
      end
    end
  end
end
