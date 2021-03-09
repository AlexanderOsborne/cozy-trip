class Traveltime
  attr_reader :travel_time
  def initialize(data)
    @travel_time = duration(data[:route][:realTime])
  end

  def duration(seconds)
    minutes, seconds = seconds.divmod(60)
    hours, minutes = minutes.divmod(60)
    "#{hours.to_s.rjust(1)} hours #{minutes.to_s.rjust(2)} min"
  end
end