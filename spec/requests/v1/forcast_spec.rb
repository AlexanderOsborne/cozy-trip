require 'rails_helper'

RSpec.describe 'it returns a forecast'do
  it 'it returns a forecast in JSON' do
    get '/api/v1/location?location=Boulder,Co'
    expect(response).to be_successful
    
    forecast = JSON.parse(response.body, symbolize_names: true)
    require 'pry'; binding.pry
  end
end