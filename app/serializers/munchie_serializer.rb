class MunchieSerializer
  include JSONAPI::Serializer
  set_type :munchie
  attributes :destination_city, :travel_time, :forecast, :restaurant
end
