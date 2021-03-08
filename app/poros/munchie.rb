class Munchie
  attr_reader :destination_city,
              :travel_time,
              :forecast,
              :restaurant

  def initialize(data)
    destination_city = data[:destination]
    travel_time = travel_time = DirectionFacade.travel_time(data)
    forecast = SummaryForecastFacade.forecast(destination_city)
    restaurant = RestaurantFacade.restaurant(data)
    require 'pry'; binding.pry
  end
end