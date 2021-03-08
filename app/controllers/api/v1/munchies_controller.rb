class Api::V1::MunchiesController < ApplicationController
  def index
    munchie = MunchieFacade.munchie(params)
    render json: MunchieSerializer.new(munchie), status: 201 
  end
end