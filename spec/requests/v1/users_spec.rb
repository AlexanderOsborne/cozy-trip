require 'rails_helper'

RSpec.describe 'it returns an image' do
  it 'returns JSON' do
    user = User.create(email: "admin@example.com", password: "password", password_confirmation: "password")
    headers = {
      'Accept' => 'application/json', 
      'Content-Type' => 'application/json'
    }
    
    post '/api/v1/users', params: JSON.generate("users": {email: "admin@example.com", password: "password", password_confirmation: "password"}), headers: headers
    expect(response).to be_successful
    expect(response.status).to eq(201)
    
    user = JSON.parse(response.body, symbolize_names: true)

    expect(user).to be_a(Hash)
    expect(user[:data][:id]).to be_a(String)
    expect(user[:data][:type]).to be_a(String)
    expect(user[:data][:attributes].keys).to match_array([:email, :api_key])
    expect(user[:data][:attributes][:email]).to be_a(String)
    expect(user[:data][:attributes][:api_key]).to be_a(String)
  end

  it 'Sadpaths' do
    post '/api/v1/users'
 
    expect(response.status).to eq(400)
  end
end