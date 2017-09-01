class Seat
  attr_accessor :number, :seat_type

  def initialize(seatplan: nil, row_col: nil)
    return unless seatplan && row_col
    row_col = row_col.split '_'
    row = row_col.first.to_i
    col = row_col.last.to_i

    @number = seats_in_previous_rows(seatplan, row) + seats_in_current_row(seatplan, row, col)
    @seat_type = seatplan.get_seat(row, col)
  end

  def ==(other)
    number == other.number && seat_type == other.seat_type
  end

  private

  def seats_in_previous_rows(seatplan, row)
    seat_rows = seatplan.only_seat_rows
    seats_in_previous_rows = seat_rows[0...row-1].reduce(0) do |sum, row|
      sum + row.size
    end
  end

  def seats_in_current_row(seatplan, row, col)
    only_seats_regex = /#{SeatType.nonseat_chars.join('|')}/
    seatplan.rows[row-1][0...col].gsub(only_seats_regex, '').size
  end
end
