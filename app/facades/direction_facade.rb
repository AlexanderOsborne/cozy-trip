class DirectionFacade
  class << self

    def travel_time(data)
      time = get_time(data)

    end

    def get_time(data)
      route = MapquestService.directions("#{data[:start]}", "#{data[:destination]}")
      time = route[:route][:realTime]
      duration(time)
    end

    def duration(seconds)
      minutes, seconds = seconds.divmod(60)
      hours, minutes = minutes.divmod(60)
    
      "#{hours.to_s.rjust(1)} hours #{minutes.to_s.rjust(2)} min"
    end
  end
end