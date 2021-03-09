class Api::V1::UsersController < ApplicationController

  def create
    begin
      user = User.new(user_params)
      user.save
      render json: UserSerializer.new(user),  status:201
    rescue
      render json: {"error" => "User credentials invalid"}, status:400
    end
  end

  private
  def user_params
    params.require(:users).permit(:email, :password, :password_confirmation)
  end
end