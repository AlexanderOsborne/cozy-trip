class Image
  attr_reader :id,
              :image
  def initialize(data)
    @id = nil
    @image = image_hash(data)
  end

  def image_hash(data)
    {
      details: {
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