class InterimReport < Report
  responds_to_format :pdf
  
  def name
    'interim_rooming_list'
  end

  def locals
    InterimReportView.for(tour_hotel: @object)
  end
end
