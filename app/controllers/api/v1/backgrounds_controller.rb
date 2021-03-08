class Api::V1::BackgroundsController < ApplicationController

  def index
    if params[:location].present?
    background = BackgroundFacade.image(params[:location])
    render json: ImageSerializer.new(background), status:200
    else
      render json: {"error" => "We can't find what you're looking for"}, status:400
    end
  end
end