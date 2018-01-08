class PickupListXls < XlsView
  def self.render(book)
    sheet = book.create_worksheet name: 'Pickup List'
    sheet[0, 0] = 'Leisuretime, South Gate House, Wood Street, Cardiff, CF10 1EW'
    sheet[1, 0] = 'Outward Pickup List'
    sheet[2, 0] = "Tour: #{tour_id} #{tour_name} - Departing on #{departure_date}"
    header_format = Spreadsheet::Format.new weight: :bold
    header_format.horizontal_align = :center
    sheet.row(0).default_format = header_format
    sheet.row(1).default_format = header_format
    sheet.row(2).default_format = header_format
    sheet.row(0).height = 20
    sheet.row(1).height = 20
    sheet.row(2).height = 20
    sheet.merge_cells(0, 0, 0, 6)
    sheet.merge_cells(1, 0, 1, 6)
    sheet.merge_cells(2, 0, 2, 6)
    sheet.column(0).width = 65
    sheet.column(1).width = 15
    sheet.column(2).width = 25
    sheet.column(3).width = 15
    sheet.column(4).width = 15
    sheet.column(5).width = 15
    sheet.column(6).width = 30

    bold_format = Spreadsheet::Format.new weight: :bold
    sheet.row(4).concat ['Pickup Point', 'Seat No', 'Passenger Name', 'Contact No', 'Pax Type', 'Booking Ref', 'Pickup Requests and Options']
    sheet.row(4).default_format = bold_format
    row = 5
    pickup_points.each do |point|
      point.passengers.each_with_index do |passenger, i|
        sheet.row(row).set_format(0, bold_format)
        sheet.row(row).concat [
          i == 0 ? "#{point.time} #{point.address}" : nil,
          passenger.seat.to_s,
          passenger.name,
          passenger.number,
          passenger.pax_type,
          passenger.booking_ref,
          passenger.requests_and_options
        ]
        row += 1
      end
      sheet.row(row).default_format = bold_format
      sheet[row, 1] = "#{point.passengers.size} Pax"
      row += 1
    end
  end
end
