class MunchieFacade
  class << self

    def munchie(data)
      destination_city = data[:destination]
      travel_time = travel_time = DirectionFacade.travel_time(data)
      require 'pry'; binding.pry
    end
  end
end