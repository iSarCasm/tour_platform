class PickupReport < Report
  def name
    "pickup_list_#{object.title}"
  end

  def locals
    PickupReportView.for(tour_coach: object)
  end

  class Pdf < PickupReport
    include PdfReport
  end

  class Xls < PickupReport
    include XlsReport
    def write_content(book)
      PickupListXls.new(locals).render(book)
    end
  end
end
