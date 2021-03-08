require 'rails_helper'

RSpec.describe 'YelpService'do
  it 'It can connect to Yelp' do

    search = YelpService.search({destination: "Boulder, Co", food: "hamburger"})
    
    expect(search).to have_key(:businesses)
    expect(search).to have_key(:total)
    expect(search).to have_key(:region)

    search[:businesses].each do |business|
      expect(business).to have_key(:name)
      expect(business[:location]).to have_key(:display_address)
    end
  end
end