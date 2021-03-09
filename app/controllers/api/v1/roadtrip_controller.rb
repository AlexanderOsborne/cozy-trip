class Api::V1::RoadtripController < ApplicationController

  def create
    roadtrip = RoadtripFacade.route(params)
    # require 'pry'; binding.pry
  end
end