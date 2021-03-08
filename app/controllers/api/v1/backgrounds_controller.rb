class Api::V1::BackgroundsController < ApplicationController

  def index
    # location = UnsplashService.photo(params[:location])
    require 'pry'; binding.pry
    background = BackgroundFacade.image(params[:location])
  end
end