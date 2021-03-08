class SummaryForecastFacade
  class << self

    def forecast(destination)
      coordinates = LocationFacade.coordinates(destination)
      forecast = OpenweatherService.forecast(coordinates)
      summary = SummaryForecast.new(forecast)
    end
  end
end