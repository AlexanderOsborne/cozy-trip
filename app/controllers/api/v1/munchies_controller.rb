class Api::V1::MunchiesController < ApplicationController
  def index
    munchie = MunchieFacade.munchie(params)
  end
end