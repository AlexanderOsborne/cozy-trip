require 'rails_helper'

RSpec.describe 'It creates an Image poro' do
  it 'It returns image attributes' do
    data = UnsplashService.photo("Boulder, Co")
    image = Image.new(data)
    hash = image.image_hash(data)

    expect(hash).to be_a(Hash)

    expect(hash.keys).to match_array([:image, :credit])
    expect(hash[:image].keys).to match_array([:location, :url])
    expect(hash[:image][:location]).to be_a(String)
    expect(hash[:image][:url]).to be_a(String)
    expect(hash[:credit].keys).to match_array([:photographer, :portfolio])
    expect(hash[:credit][:photographer]).to be_a(String)
    expect(hash[:credit][:portfolio]).to be_a(String)
  end
end