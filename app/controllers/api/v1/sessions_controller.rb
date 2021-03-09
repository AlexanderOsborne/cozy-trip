class Api::V1::SessionsController < ApplicationController

  def create
    begin
      user = User.find_by(email: params[:users][:email])
      render json: UserSerializer.new(user),  status:200
    rescue
      render json: {"error" => "User credentials invalid"}, status:400
    end
  end
end