class Api::V1::SessionsController < ApplicationController

  def create
    user = User.new(params)
    require 'pry'; binding.pry
    user.save
  end
end