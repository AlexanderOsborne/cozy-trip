class WeatherFacade
  class << self

    def weather(data)
      Forecast.new(data)
    end
end
end