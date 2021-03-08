class Restaurant
  attr_reader :name,
              :address

  def initialize(data)
    @name = data[:businesses][0][:name]
    @address = data[:businesses][0][:location][:display_address]
  end
end