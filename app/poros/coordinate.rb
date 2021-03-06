class Coordinate
  attr_reader :latitude, :longitude

  def initialize(data)
    @latitude = data[:locations][0][:latLng][:lat]
    @longitude = data[:locations][0][:latLng][:lng]
  end
end