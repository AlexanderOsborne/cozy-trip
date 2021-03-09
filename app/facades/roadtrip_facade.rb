class RoadtripFacade
  class << self

    def route(data)
      route = MapquestService.route(data)
      require 'pry'; binding.pry
    end
  end
end

# route[:route][:formattedTime]