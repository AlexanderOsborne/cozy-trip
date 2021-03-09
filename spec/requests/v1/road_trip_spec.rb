require 'rails_helper'

RSpec.describe 'it creates a road_trip' do
  it 'Happy path' do
    headers = {
      'Accept' => 'application/json', 
      'Content-Type' => 'application/json'
    }

    post '/api/v1/roadtrip', params: JSON.generate({
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }), headers: headers

    

    expect(response).to be_successful
    expect(response.status).to eq(201)
    require 'pry'; binding.pry
    
  end

  it 'Sadpaths' do
    post '/api/v1/roadtrip'

    expect(response.status).to eq(400)
  end
end