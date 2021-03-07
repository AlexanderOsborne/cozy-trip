class Forecast
  attr_reader :current_weather,
              :daily_weather,
              :hourly_weather
  
  def initialize(data)
    @current_weather = CurrentWeather.new(data)
    @daily_weather = data[:daily].first(5).each { |day| DailyWeather.new(day)}
    @hourly_weather = data[:hourly].first(8).each { |hour| HourlyWeather.new(hour)}
    require 'pry'; binding.pry
  end
end
