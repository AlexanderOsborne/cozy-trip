class RoadtripFacade
  class << self

    def route(data)
      route = MapquestService.route(data)
      if route[:info][:messages] == ["We are unable to route with the given locations."]
        coordinates = LocationFacade.coordinates(data[:destination])
        forecast = {}
        start_city = data[:origin]
        end_city = data[:destination]
        travel_time = "impossible"
        weather_at_eta = {}
        roadtrip = Roadtrip.new({start_city: start_city, end_city: end_city, travel_time: travel_time, weather_at_eta: weather_at_eta})
      else
        coordinates = LocationFacade.coordinates(data[:destination])
        forecast = OpenweatherService.forecast(coordinates)
        start_city = data[:origin]
        end_city = data[:destination]
        travel_time = Traveltime.new(route)
        weather_at_eta = ETAForecastFacade.forecast(forecast, route)
        roadtrip = Roadtrip.new({start_city: start_city, end_city: end_city, travel_time: travel_time, weather_at_eta: weather_at_eta})
      end
    end
  end
end