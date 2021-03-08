class DirectionFacade
  class << self

    def travel_time(data)
      time = get_time(data)
      # require 'pry'; binding.pry
    end

    def get_time(data)
      route = MapquestService.directions("#{data[:start]}", "#{data[:destination]}")
      time = route[:route][:realTime]
      # require 'pry'; binding.pry
      # formatted_time = distance_of_time_in_words(time)
    end
  end
end