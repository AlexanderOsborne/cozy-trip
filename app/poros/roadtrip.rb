class Roadtrip
  attr_reader :id,
              :start_city,
              :end_city,
              :travel_time,
              :weather_at_eta
    
  def initialize(data)
    @id = nil
    @start_city = data[:start_city]
    @end_city = data[:end_city]
    @travel_time = time(data)
    @weather_at_eta = data[:weather_at_eta]
  end

  def time(data)
    if data[:travel_time] == "Invalid route. Route is either impossible or currently blocked"
      data[:travel_time]
    else
      data[:travel_time].travel_time
    end
  end  
end