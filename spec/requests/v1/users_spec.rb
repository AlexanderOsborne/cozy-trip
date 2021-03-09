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
    expect(response.status).to eq(200)
  end

#   it 'Sadpaths' do
#     get '/api/v1/backgrounds'

#     expect(response.status).to eq(400)
#   end
end