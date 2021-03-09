class Image
  attr_reader :id,
              :location,
              :url,
              :photographer,
              :portfolio

  def initialize(data)
    @id = nil
    image_hash(data)
  end

  def image_hash(data)
    {
      image: {
        location: data[:location][:title],
        url: data[:urls][:regular]
      },
      credit: {
        photographer: data[:user][:name],
        portfolio: data[:user][:links][:portfolio]
       }
    }
  end
end