class Image
  attr_reader :id,
              :location,
              :url,
              :photographer,
              :portfolio

  def initialize(data)
    @id = nil
    @location = data[:location][:title]
    @url = data[:urls][:regular]
    @photographer = data[:user][:name]
    @portfolio = data[:user][:links][:portfolio]
  end
end