require 'rails_helper'

RSpec.describe 'it returns a forecast'do
  it 'it returns a forecast in JSON' do
    get '/api/v1/forecast?location=Boulder,Co'
    
    expect(response).to be_successful
    expect(response.status).to eq(201)

    forecast = JSON.parse(response.body, symbolize_names: true)

    expect(forecast).to be_a(Hash)
    expect(forecast[:data][:id]).to eq(nil)
    expect(forecast[:data][:type]).to eq("forecast")

    expect(forecast[:data][:attributes].keys).to match_array(%i[current_weather daily_weather hourly_weather])
    expect(forecast[:data][:attributes][:current_weather].keys).to match_array([:conditions, :datetime, :feels_like, :humidity, :icon, :sunrise, :sunset, :temperature, :uvi, :visibility])
    expect(forecast[:data][:attributes][:daily_weather]).to be_a(Array)
    expect(forecast[:data][:attributes][:daily_weather][0].keys).to match_array([:date, :sunrise, :sunset, :max_temp, :min_temp, :conditions, :icon])
    expect(forecast[:data][:attributes][:hourly_weather]).to be_a(Array)
    expect(forecast[:data][:attributes][:hourly_weather][0].keys).to match_array([:time, :temperature, :conditions, :icon])
    expect(forecast[:data][:attributes][:current_weather][:datetime]).to be_a(String)
    expect(forecast[:data][:attributes][:current_weather][:sunrise]).to be_a(String)
    expect(forecast[:data][:attributes][:current_weather][:sunset]).to be_a(String)
    expect(forecast[:data][:attributes][:current_weather][:temperature]).to be_a(Float)
    

    expect(forecast[:data][:attributes][:current_weather][:feels_like]).to be_a(Float)
    expect(forecast[:data][:attributes][:current_weather][:humidity]).to be_a(Numeric)
    expect(forecast[:data][:attributes][:current_weather][:uvi]).to be_a(Numeric)
    expect(forecast[:data][:attributes][:current_weather][:visibility]).to be_a(Numeric)
    expect(forecast[:data][:attributes][:current_weather][:conditions]).to be_a(String)
    expect(forecast[:data][:attributes][:current_weather][:icon]).to be_a(String)
    
    expect(forecast[:data][:attributes][:daily_weather][0][:date]).to be_a(String)
    expect(forecast[:data][:attributes][:daily_weather][0][:sunrise]).to be_a(String)
    expect(forecast[:data][:attributes][:daily_weather][0][:max_temp]).to be_a(Float)
    expect(forecast[:data][:attributes][:daily_weather][0][:min_temp]).to be_a(Float)
    expect(forecast[:data][:attributes][:daily_weather][0][:conditions]).to be_a(String)
    expect(forecast[:data][:attributes][:daily_weather][0][:icon]).to be_a(String)

    expect(forecast[:data][:attributes][:hourly_weather][0][:time]).to be_a(String)
    expect(forecast[:data][:attributes][:hourly_weather][0][:temperature]).to be_a(Float)
    expect(forecast[:data][:attributes][:hourly_weather][0][:conditions]).to be_a(String)
    expect(forecast[:data][:attributes][:hourly_weather][0][:icon]).to be_a(String)
  end

  it 'returns an error on sadpath' do
    get '/api/v1/forecast'

    expect(response.status).to eq(400)
  end
end