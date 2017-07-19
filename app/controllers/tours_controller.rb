class ToursController < ApplicationController
  def show
    @tour = Tour.find(params[:id])
  end

  def booking
    @tour = Tour.find(params[:id])
    @active_tours = @tour.active_tours
  end
end
