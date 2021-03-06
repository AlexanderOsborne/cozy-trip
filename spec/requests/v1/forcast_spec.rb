require 'rails_helper'

RSpec.describe 'it returns a forcast'do
  it 'it returns a forcast in JSON' do
    get '/api/v1/location?location=Boulder,Co'
    expect(response).to be_successful
    
    forcast = JSON.parse(response.body, symbolize_names: true)
    require 'pry'; binding.pry
  end
end