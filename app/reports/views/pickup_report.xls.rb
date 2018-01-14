class PickupReportXls < XlsView
  def render(book)
    sheet = book.create_worksheet name: 'Pickup List'
    format_sheet(sheet)
    sheet[0, 0] = 'Leisuretime, South Gate House, Wood Street, Cardiff, CF10 1EW'
    sheet[1, 0] = 'Outward Pickup List'
    sheet[2, 0] = "Tour: #{tour_id} #{tour_name} - Departing on #{departure_date}"
    sheet.row(4).concat [
      'Pickup Point',
      'Seat No',
      'Passenger Name',
      'Contact No',
      'Pax Type',
      'Booking Ref',
      'Pickup Requests and Options'
    ]
    row = 5
    pickup_points.each do |point|
      point.passengers.each_with_index do |passenger, i|
        sheet.row(row).concat [
          i == 0 ? "#{point.time} #{point.address}" : nil,
          passenger.seat.to_s,
          passenger.name,
          passenger.number,
          passenger.pax_type,
          passenger.booking_ref,
          passenger.requests_and_options
        ]
        sheet.row(row).set_format(0, bold_format) # first col of row is bold
        row += 1
      end
      sheet[row, 1] = "#{point.passengers.size} Pax"
      sheet.row(row).default_format = bold_format
      row += 1
    end
  end

  def format_sheet(sheet)
    header_format = Spreadsheet::Format.new weight: :bold
    header_format.horizontal_align = :center
    for i in 0..2
      sheet.row(i).default_format = header_format
      sheet.row(i).height = 20
      sheet.merge_cells(i, 0, i, 6)
    end
    sheet.column(0).width = 65
    sheet.column(1).width = 15
    sheet.column(2).width = 25
    sheet.column(3).width = 15
    sheet.column(4).width = 15
    sheet.column(5).width = 15
    sheet.column(6).width = 30
    sheet.row(4).default_format = bold_format
  end

  def bold_format
    Spreadsheet::Format.new weight: :bold
  end
end
