require 'rails_helper'

RSpec.describe 'Returns EtaForecast'do
  it 'Returns time less than a day' do

    data = {temp: 72, weather:[{description: "perfect"}]}
    forecast = EtaForecast.new(data)

    expect(forecast.temperature).to be_a(Integer)
    expect(forecast.temperature).to eq(72)
    expect(forecast.conditions).to be_a(String)
    expect(forecast.conditions).to eq("perfect")
  end
end