class PickupReport < Report
  responds_to_format :pdf
  responds_to_format :xls

  def name
    "pickup_list_#{object.title}"
  end

  def locals
    PickupReportView.for(tour_coach: object)
  end
end
