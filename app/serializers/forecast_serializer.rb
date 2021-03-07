class ForecastSerializer
  include JSONAPI::Serializer
  
  set_type :forecast
  # require 'pry'; binding.pry
  set_id :id
  attributes :current_weather, :daily_weather, :hourly_weather
end
