class CurrentWeather
  attr_reader :datetime,
              :sunrise,
              :sunset,
              :temp,
              :feels_like,
              :humidity,
              :uvi,
              :visibility,
              :conditions,
              :icon

  def initialize(data)
  @datetime = Time.at(data[:current][:dt])
  @sunrise = Time.at(data[:current][:sunrise])
  @sunset = Time.at(data[:current][:sunset])
  @temp = data[:current][:temp]
  @feels_like = data[:current][:feels_like]
  @humidity = data[:current][:humidity]
  @uvi = data[:current][:uvi]
  @visibility = data[:current][:visibility]
  @conditions = data[:current][:weather][0][:main]
  @icon = data[:current][:weather][0][:icon]
  end
end
