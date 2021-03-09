class RoadtripFacade
  class << self

    def route(data)
      route = MapquestService.route(data)
      start_city = data[:origin]
      end_city = data[:destination]
      travel_time = Traveltime.new(route)
      require 'pry'; binding.pry
    end
  end
end

