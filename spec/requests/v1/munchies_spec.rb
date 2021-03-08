require 'rails_helper'

RSpec.describe 'Munchies Endpoint' do

  it 'it returns JSON' do
    get '/api/v1/munchies?start=denver,co&destination=pueblo,co&food=hamburger'

    expect(response.status).to eq(success)
  end
end