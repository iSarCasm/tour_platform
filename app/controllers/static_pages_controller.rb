class StaticPagesController < ApplicationController
  def home
    @tours = Tour.all
  end
end
