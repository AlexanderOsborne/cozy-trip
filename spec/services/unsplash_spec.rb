require 'rails_helper'

RSpec.describe 'it returns an image'do
  
  it 'it connects to unsplash and returns an object' do
    object = UnsplashService.photo("Denver, Co")

    image = JSON.parse(object.body, symbolize_names: true)
    expect(image).to be_a(Hash)
    expect(image.keys).to match_array([:alt_description, :blur_hash, :categories, :color, :created_at, :current_user_collections, :description, :likes, :links, :location, :promoted_at, :sponsorship, :updated_at, :urls, :user, :views, :width,:downloads, :exif, :height, :id, :liked_by_user])
  end
end