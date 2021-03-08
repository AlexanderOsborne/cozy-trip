require 'rails_helper'

RSpec.describe 'it returns an image' do
  it 'returns JSON' do
    get '/api/v1/backgrounds?location=Boulder,CO'

    expect(response).to be_successful
    expect(response.status).to eq(200)
    require 'pry'; binding.pry
  end
end