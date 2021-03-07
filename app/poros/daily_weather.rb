class DailyWeather
  attr_reader :datetime,
              :sunrise,
              :sunset,
              :max_temp,
              :min_temp,
              :conditions,
              :icon

  def initialize(data)
    @datetime = data[:dt]
    @sunrise = data[:sunrise]
    @sunset = data[:sunset]
    @max_temp = data[:temp][:max]
    @min_temp = data[:temp][:max]
    @conditions = data[:weather][0][:description]
    @icon = data[:weather][0][:icon]
  end
end