class LocationFacade
  class << self
  
    def coordinates(location)
      data = MapquestService.coordinates(location)
      data[:results].map do |location|
        # require 'pry'; binding.pry
        Coordinate.new(location)
      end
    end
  end
end