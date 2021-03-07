class Api::V1::LocationController < ApplicationController
  def index
    coordinates = LocationFacade.coordinates(params[:location])
    forecast = OpenweatherService.forecast(coordinates)
    weather = WeatherFacade.weather(forecast)
    render json: ForecastSerializer.new(weather)
  end
end