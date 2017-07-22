class ToursController < ApplicationController
  before_action :get_tour

  def show
    @active_tours = @tour.active_tours
  end

  private

  def get_tour
    @tour = Tour.find(params[:id])
  end
end
