class InterimReport < Report
  def name
    'interim_rooming_list'
  end

  def locals
    InterimReportView.for(tour_hotel: @object)
  end

  class Pdf < InterimReport
    include PdfReport
  end
end
