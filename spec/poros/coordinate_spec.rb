require 'rails_helper'

RSpec.describe 'Creates a Coordinate'do
it 'Returns Coordinates' do
  data = MapquestService.coordinates("Boulder, Co")
  location = data[:results][0]
  coordinate = Coordinate.new(location)
  
  expect(coordinate.latitude).to eq(40.015831)
  expect(coordinate.longitude).to eq(-105.27927)
  end
end