class Api::V1::LocationController < ApplicationController
  def index
    coordinates = LocationFacade.coordinates(params[:location])
    forcast = OpenweatherService.forcast(coordinates)
    require 'pry'; binding.pry
  end
end