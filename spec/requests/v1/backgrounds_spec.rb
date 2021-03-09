require 'rails_helper'

RSpec.describe 'it returns an image' do
  it 'returns JSON' do
    get '/api/v1/backgrounds?location=Boulder,CO'

    expect(response).to be_successful
    expect(response.status).to eq(200)

    image = JSON.parse(response.body, symbolize_names: true)

    expect(image).to be_a(Hash)
    expect(image[:data][:id]).to eq(nil)
    expect(image[:data][:type]).to eq("image")
    expect(image[:data][:attributes][:image].keys).to match_array([:details, :credit])
    expect(image[:data][:attributes][:image][:details].keys).to match_array([:location, :url])
    expect(image[:data][:attributes][:image][:details][:location]).to be_a(String)
    expect(image[:data][:attributes][:image][:details][:url]).to be_a(String)
    expect(image[:data][:attributes][:image][:credit].keys).to match_array([:photographer, :portfolio])
    expect(image[:data][:attributes][:image][:credit][:photographer]).to be_a(String)
    expect(image[:data][:attributes][:image][:credit][:portfolio]).to be_a(String)
  end

  it 'Sadpaths' do
    get '/api/v1/backgrounds'

    expect(response.status).to eq(400)
  end
end