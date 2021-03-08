class WeatherFacade
  class << self

    def weather(data)
      @current_weather = CurrentWeather.new(data)
      @daily_weather = data[:daily].first(5).map { |day| DailyWeather.new(day)}
      @hourly_weather = data[:hourly].first(8).map { |hour| HourlyWeather.new(hour)}
      Forecast.new({current_weather: @current_weather, daily_weather: @daily_weather, hourly_weather: @hourly_weather})
    end
end
end