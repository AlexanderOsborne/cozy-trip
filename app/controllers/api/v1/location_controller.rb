class Api::V1::LocationController < ApplicationController
  def index
    begin
      coordinates = LocationFacade.coordinates(params[:location])
      forecast = OpenweatherService.forecast(coordinates)
      weather = WeatherFacade.weather(forecast)
      render json: ForecastSerializer.new(weather), status:201
    rescue
      render json: {"error" => {}}, status:400
    end
  end
end