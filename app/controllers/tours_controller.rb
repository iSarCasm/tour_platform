class ToursController < ApplicationController
  load_and_authorize_resource :find_by => :slug

  def show
    @active_tours = @tour.active_tours
  end
end
