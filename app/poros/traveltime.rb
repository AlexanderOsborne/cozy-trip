class Traveltime
  attr_reader :travel_time
  def initialize(data)
    if data[:route][:realTime] > 86400
      @travel_time = day_duration(data[:route][:realTime])
    else
      @travel_time = duration(data[:route][:realTime])
    end
  end

  def duration(seconds)
    minutes, seconds = seconds.divmod(60)
    hours, minutes = minutes.divmod(60)
    "#{hours.to_s.rjust(1)} hours #{minutes.to_s.rjust(2)} min"
  end

  def day_duration(seconds)
    minutes, seconds = seconds.divmod(60)
    hours, minutes = minutes.divmod(60)
    days, hours = hours.divmod(24)
    "#{days.to_s.rjust(2)} days #{hours.to_s.rjust(2)} hours #{minutes.to_s.rjust(2)} minutes"
  end
end