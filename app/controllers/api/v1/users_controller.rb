class Api::V1::UsersController < ApplicationController

  def create
    require 'pry'; binding.pry
    user = User.create!(user_params)
  end

  private

  def user_params
    params.require(:users).permit(:email, :password, :password_confirmation)
  end
end