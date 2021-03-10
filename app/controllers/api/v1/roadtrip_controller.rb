class Api::V1::RoadtripController < ApplicationController

  def create
    if User.where(api_key: params[:api_key]).exists?
      begin 
        roadtrip = RoadtripFacade.route(params)
        render json: RoadtripSerializer.new(roadtrip), status:201
      rescue
        render json: {"Something went wrong" => {}}, status:400
      end
    else
      render json: {"Unauthorized" => {}}, status:401
    end
  end
end