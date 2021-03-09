require 'rails_helper'

RSpec.describe 'Creates weather poros'do
it 'Returns current forecast' do
  data = MapquestService.coordinates("Boulder, Co")
  location = data[:results][0]
  coordinates = [Coordinate.new(location)]
  
  weather = OpenweatherService.forecast(coordinates)
  current_weather = weather
  current = CurrentWeather.new(weather)

  expect(current.conditions).to be_a(String)
  expect(current.datetime).to be_a(Time)
  expect(current.sunrise).to be_a(Time)
  expect(current.sunset).to be_a(Time)
  expect(current.feels_like).to be_a(Float)
  expect(current.humidity).to be_a(Integer)
  expect(current.uvi).to be_a(Integer)
  expect(current.visibility).to be_a(Integer)
  
  daily = DailyWeather.new(weather[:daily][0])
  
  expect(daily.sunrise).to be_a(Time)
  expect(daily.sunset).to be_a(Time)
  expect(daily.max_temp).to be_a(Float)
  expect(daily.min_temp).to be_a(Float)
  expect(daily.conditions).to be_a(String)
  expect(daily.icon).to be_a(String)
  expect(daily.date).to be_a(Time)
  
  hourly = HourlyWeather.new(weather[:hourly][0])

  expect(hourly.time).to be_a(Time)
  expect(hourly.temperature).to be_a(Float)
  expect(hourly.conditions).to be_a(String)
  expect(hourly.icon).to be_a(String)

  forecast = Forecast.new({current_weather: current, daily_weather: daily, hourly_weather: hourly})

  expect(forecast.current_weather).to eq(current)
  expect(forecast.daily_weather).to eq(daily)
  expect(forecast.hourly_weather).to eq(hourly)
end
end