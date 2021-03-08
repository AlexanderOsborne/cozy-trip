class Api::V1::MunchiesController < ApplicationController
  def index
    begin
      munchie = MunchieFacade.munchie(params)
      render json: MunchieSerializer.new(munchie), status: 201 
    rescue
      render json: {"error" => {}}, status:400
    end
  end
end