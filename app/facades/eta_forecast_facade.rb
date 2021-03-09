class ETAForecastFacade
  class << self

    def forecast(forecast, route)
      travel_time = route[:route][:realTime]
      arrival_time = DateTime.now.utc + travel_time.seconds
      rounded_time = arrival_time.beginning_of_hour.to_i
      weather = forecast = forecast[:hourly].find {|x| x[:dt] = rounded_time}
      require 'pry'; binding.pry
    end
  end
end

# route[:route][:realTime]
# Time.now.utc + route[:route][:realTime].seconds
# utctime.to_time.to_i
# forecast = forecast[:hourly].find {|x| x[:dt] = "1615478400"}