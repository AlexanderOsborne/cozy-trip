require 'rails_helper'

RSpec.describe 'Creates weather poros'do
  it 'Returns current forecast' do
    data = MapquestService.coordinates("Boulder, Co")
    location = data[:results][0]
    coordinates = [Coordinate.new(location)]
    weather = OpenweatherService.forecast(coordinates)
  end
end