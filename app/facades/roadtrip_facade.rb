class RoadtripFacade
  class << self

    def route(data)
      route = MapquestService.route(data)
      coordinates = LocationFacade.coordinates(data[:destination])
      forecast = OpenweatherService.forecast(coordinates)
      start_city = data[:origin]
      end_city = data[:destination]
      travel_time = Traveltime.new(route)
      weather_at_eta = ETAForecastFacade.forecast(forecast, route)
      # require 'pry'; binding.pry
    end
  end
end

