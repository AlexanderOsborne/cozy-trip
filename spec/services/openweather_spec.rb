require 'rails_helper'

RSpec.describe 'Openweather Service' do
  it 'it can return forecast' do
    data = MapquestService.coordinates("Boulder, Co")
    location = data[:results][0]
    coordinate = Coordinate.new(location)
    params = Hash.new{coordinate}

    weather = OpenweatherService.forecast(params)
    
    expect(weather).to be_a(Hash)
    expect(weather.keys).to match_array([:lat, :lon, :timezone, :timezone_offset, :current, :hourly, :daily])
    
    expect(weather[:current]).to be_a(Hash)
    expect(weather[:daily]).to be_a(Array)
    expect(weather[:hourly]).to be_a(Array)
  end
end