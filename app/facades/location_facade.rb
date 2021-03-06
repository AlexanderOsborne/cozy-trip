class LocationFacade
  class << self
  
    def coordinates(location)
      data = MapquestService.coordinates(location)
      data[:results].map do |location|
        Coordinate.new(location)
      end
    end
  end
end