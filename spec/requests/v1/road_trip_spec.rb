require 'rails_helper'

RSpec.describe 'it creates a road_trip' do
  it 'Happy path, short trip' do
    user = User.create(email: "admin@example.com", password: "password")
    headers = {
      'Accept' => 'application/json', 
      'Content-Type' => 'application/json'
    }

    post '/api/v1/roadtrip', params: JSON.generate({
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": "#{user.api_key}"
    }), headers: headers

    expect(response).to be_successful
    expect(response.status).to eq(201)

    roadtrip = JSON.parse(response.body, symbolize_names: true)
    expect(roadtrip).to be_a(Hash)
    expect(roadtrip[:data][:id]).to eq(nil)
    expect(roadtrip[:data][:type]).to eq("roadtrip")
    expect(roadtrip[:data][:attributes].keys).to match_array([:start_city, :end_city, :travel_time, :weather_at_eta])
    expect(roadtrip[:data][:attributes][:start_city]).to be_a(String)
    expect(roadtrip[:data][:attributes][:end_city]).to be_a(String)
    expect(roadtrip[:data][:attributes][:travel_time]).to be_a(String)
    expect(roadtrip[:data][:attributes][:weather_at_eta][:conditions]).to be_a(String)
    expect(roadtrip[:data][:attributes][:weather_at_eta][:temperature]).to be_a(Float)
  end

  it 'Happy path, long trip' do
    user = User.create(email: "admin@example.com", password: "password")
    headers = {
      'Accept' => 'application/json', 
      'Content-Type' => 'application/json'
    }

    post '/api/v1/roadtrip', params: JSON.generate({
      "origin": "New York City, NY",
      "destination": "Los Angeles, CA",
      "api_key": "#{user.api_key}"
    }), headers: headers

    expect(response).to be_successful
    expect(response.status).to eq(201)

    roadtrip = JSON.parse(response.body, symbolize_names: true)
    expect(roadtrip).to be_a(Hash)
    expect(roadtrip[:data][:id]).to eq(nil)
    expect(roadtrip[:data][:type]).to eq("roadtrip")
    expect(roadtrip[:data][:attributes].keys).to match_array([:start_city, :end_city, :travel_time, :weather_at_eta])
    expect(roadtrip[:data][:attributes][:start_city]).to be_a(String)
    expect(roadtrip[:data][:attributes][:end_city]).to be_a(String)
    expect(roadtrip[:data][:attributes][:travel_time]).to be_a(String)
    expect(roadtrip[:data][:attributes][:weather_at_eta][:conditions]).to be_a(String)
    expect(roadtrip[:data][:attributes][:weather_at_eta][:temperature]).to be_a(Float)
  end

  it 'Happy path, mega trip' do
    user = User.create(email: "admin@example.com", password: "password")
    headers = {
      'Accept' => 'application/json', 
      'Content-Type' => 'application/json'
    }

    post '/api/v1/roadtrip', params: JSON.generate({
      "origin": "Miami, FL",
      "destination": "Anchorage, AK",
      "api_key": "#{user.api_key}"
    }), headers: headers

    expect(response).to be_successful
    expect(response.status).to eq(201)
      # require 'pry'; binding.pry
    roadtrip = JSON.parse(response.body, symbolize_names: true)
    expect(roadtrip).to be_a(Hash)
    expect(roadtrip[:data][:id]).to eq(nil)
    expect(roadtrip[:data][:type]).to eq("roadtrip")
    expect(roadtrip[:data][:attributes].keys).to match_array([:start_city, :end_city, :travel_time, :weather_at_eta])
    expect(roadtrip[:data][:attributes][:start_city]).to be_a(String)
    expect(roadtrip[:data][:attributes][:end_city]).to be_a(String)
    expect(roadtrip[:data][:attributes][:travel_time]).to be_a(String)
    expect(roadtrip[:data][:attributes][:weather_at_eta][:conditions]).to be_a(String)
    expect(roadtrip[:data][:attributes][:weather_at_eta][:temperature]).to be_a(Float)
  end

  it 'Happy path, impossible trip' do
    user = User.create(email: "admin@example.com", password: "password")
    
    headers = {
      'Accept' => 'application/json', 
      'Content-Type' => 'application/json'
    }

    post '/api/v1/roadtrip', params: JSON.generate({
      "origin": "New York,NY",
      "destination": "London, UK",
      "api_key": "#{user.api_key}"
    }), headers: headers

    expect(response).to be_successful
    expect(response.status).to eq(201)
    
    roadtrip = JSON.parse(response.body, symbolize_names: true)
    expect(roadtrip).to be_a(Hash)
    expect(roadtrip[:data][:id]).to eq(nil)
    expect(roadtrip[:data][:type]).to eq("roadtrip")
    expect(roadtrip[:data][:attributes].keys).to match_array([:start_city, :end_city, :travel_time, :weather_at_eta])
    expect(roadtrip[:data][:attributes][:start_city]).to be_a(String)
    expect(roadtrip[:data][:attributes][:end_city]).to be_a(String)
    expect(roadtrip[:data][:attributes][:travel_time]).to eq("impossible")
    expect(roadtrip[:data][:attributes][:weather_at_eta]).to be_a(Hash)
  end
  
  it 'Sadpaths, no user data' do
    post '/api/v1/roadtrip'

    expect(response.status).to eq(401)
  end

  it 'Sadpaths, bad token' do
    user = User.create(email: "admin@example.com", password: "password")
    headers = {
      'Accept' => 'application/json', 
      'Content-Type' => 'application/json'
    }

    post '/api/v1/roadtrip', params: JSON.generate({
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": "fakekey123"
    }), headers: headers
    
    expect(response.status).to eq(401)
  end
end