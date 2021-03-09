class ETAForecastFacade
  class << self

    def forecast(forecast, route)
      travel_time = route[:route][:realTime]
      arrival_time = DateTime.now.utc + travel_time.seconds
      rounded_time = arrival_time.beginning_of_hour.to_i
      weather = forecast[:hourly].find {|x| x[:dt] = rounded_time}
      eta_forecast = EtaForecast.new(weather)
    end
  end
end
