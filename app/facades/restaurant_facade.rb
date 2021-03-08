class RestaurantFacade
  class << self

    def restaurant(data)
      suggestion = YelpService.search(data)
      restaurant = Restaurant.new(suggestion)
    end
  end
end