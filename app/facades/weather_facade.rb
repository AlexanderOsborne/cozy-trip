class WeatherFacade
  class << self


    def weather(data)
      Forecast.new(data)
    end
  # def weather(data)
  #   forecast = Hash.new
  #   forecast[:current_weather] =current(data)
  #   forecast[:daily_weather] = daily(data)
  #   forecast[:hourly_weather] = hourly(data)
  #   forecast
  # end

  # def current(data)
  #   current_weather = Hash.new
  #   current_weather[:datetime] = data[:current][:dt]
  #   current_weather[:sunrise] = data[:current][:sunrise]
  #   current_weather[:sunset] = data[:current][:sunset]
  #   current_weather[:temp] = data[:current][:temp]
  #   current_weather[:feels_like] = data[:current][:feels_like]
  #   current_weather[:humidity] = data[:current][:humidity]
  #   current_weather[:uvi] = data[:current][:uvi]
  #   current_weather[:visibility] = data[:current][:visibility]
  #   current_weather[:conditions] = data[:current][:weather][0][:main]
  #   current_weather[:icon] = data[:current][:weather][0][:icon]
  #   current_weather
  # end

  # def daily(data)
  #   daily_weather = []
  #   data[:daily][0..4].each do |day|
  #     daily = Hash.new
  #     daily[:datetime] = day[:dt]
  #     daily[:sunrise] = day[:sunrise]
  #     daily[:sunset] = day[:sunset]
  #     daily[:max_temp] = day[:temp][:max]
  #     daily[:min_temp] = day[:temp][:max]
  #     daily[:conditions] = day[:weather][0][:description]
  #     daily[:icon] = day[:weather][0][:icon]
  #     daily_weather << daily
  #   end
  # end

  # def hourly(data)
  #   hourly_weather = []
  #   data[:hourly][0..7].each do |hours|
  #     hour = Hash.new
  #     hour[:time] = hours[:dt]
  #     hour[:temperature] = hours[:temp]
  #     hour[:conditions] = hours[:weather][0][:description]
  #     hour[:icon] = hours[:weather][0][:icon]
  #     hourly_weather << hour
  #   end
  # end
end
end