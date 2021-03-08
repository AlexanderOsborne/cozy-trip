require 'rails_helper'

RSpec.describe 'Munchies Endpoint' do

  it 'it returns JSON' do
    get '/api/v1/munchies?start=denver,co&destination=pueblo,co&food=hamburger'

    expect(response).to be_successful
    expect(response.status).to eq(201)
    
    munchie = JSON.parse(response.body, symbolize_names: true)
    
    expect(munchie[:data][:attributes].keys).to match_array([:destination_city, :travel_time, :forecast, :restaurant])
    expect(munchie[:data][:attributes][:destination_city]).to be_a(String)

    expect(munchie[:data][:attributes][:travel_time]).to be_a(String)
    
    expect(munchie[:data][:attributes][:forecast].keys).to  match_array([:summary, :temperature])
    expect(munchie[:data][:attributes][:forecast][:summary]).to be_a(String)
    expect(munchie[:data][:attributes][:forecast][:temperature]).to be_a(Float)
    
    expect(munchie[:data][:attributes][:restaurant].keys).to  match_array([:name, :address])
    expect(munchie[:data][:attributes][:restaurant][:name]).to be_a(String)
    expect(munchie[:data][:attributes][:restaurant][:address]).to be_a(Array)
    
  end

  it "can sad path" do
    get '/api/v1/munchies?co&food=hamburger'

    expect(response.status).to eq(400)
  end
end