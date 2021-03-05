require 'rails_helper'

RSpec.describe 'MapquestService', type: :feature do
  describe 'It can connect to Mapquest API' do
    it 'It can return JSON' do
      search = MapquestService.coordinates("Boulder, Co")

      # require 'pry'; binding.pry
    expect(search).to have_key(:results)
    expect(search[:results]).to be_an(Array)
    search[:results].each do |result|
      expect(result).to have_key(:locations)
      result[:locations].each do |location|
        expect(location).to have_key(:latLng)
      end
      end
    end
  end
end