class SeatplanReport < Report
  responds_to_format :pdf

  def name
    'interim_rooming_list'
  end

  def locals
    SeatplanReportView.for(tour_coach: @object)
  end
end
