class PickupReport < Report
  def name
    'pickup_list'
  end

  def locals
    PickupReportView.for(tour_coach: @object)
  end
end
