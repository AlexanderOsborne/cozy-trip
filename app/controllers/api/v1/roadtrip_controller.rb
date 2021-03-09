class Api::V1::RoadtripController < ApplicationController

  def create
    begin 
      roadtrip = RoadtripFacade.route(params)
      render json: RoadtripSerializer.new(roadtrip), status:201
    rescue
      render json: {"Unauthorized" => {}}, status:401
    end
  end
end