class Api::V1::LocationController < ApplicationController
  def index
    coordinates = LocationFacade.coordinates(params[:location])
    require 'pry'; binding.pry
  end
end