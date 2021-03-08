require 'rails_helper'

RSpec.describe 'it returns a forecast'do
  it 'it returns a forecast in JSON' do
    get '/api/v1/location?location=Boulder,Co'
    expect(response).to be_successful
    expect(response.status).to eq(201)

    forecast = JSON.parse(response.body, symbolize_names: true)

    expect(forecast).to be_a(Hash)
    expect(forecast[:data][:attributes].keys).to match_array(%i[current_weather daily_weather hourly_weather])
    expect(forecast[:data][:attributes][:current_weather].keys).to match_array([:conditions, :datetime, :feels_like, :humidity, :icon, :sunrise, :sunset, :temp, :uvi, :visibility])
    expect(forecast[:data][:attributes][:daily_weather]).to be_a(Array)
    expect(forecast[:data][:attributes][:daily_weather][0].keys).to match_array([:datetime, :sunrise, :sunset, :max_temp, :min_temp, :conditions, :icon])
    expect(forecast[:data][:attributes][:hourly_weather]).to be_a(Array)
    expect(forecast[:data][:attributes][:hourly_weather][0].keys).to match_array([:time, :temperature, :conditions, :icon])
    
  end

  it 'returns an error on sadpath' do
    get '/api/v1/location'

    expect(response.status).to eq(400)
  end
end