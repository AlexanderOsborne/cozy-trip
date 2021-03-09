# require 'rails_helper'

# RSpec.describe 'it creates a road_trip' do
#   it 'Happy path' do
#     headers = {
#       'Accept' => 'application/json', 
#       'Content-Type' => 'application/json'
#     }

#     ost '/api/v1/sessions', params: JSON.generate("users": {email: "admin@example.com", password: "password"}), headers: headers

#     post '/api/v1/roadtrip'

#     expect(response).to be_successful
#     expect(response.status).to eq(200)
#   end

#   it 'Sadpaths' do
#     get '/api/v1/backgrounds'

#     expect(response.status).to eq(400)
#   end
# end