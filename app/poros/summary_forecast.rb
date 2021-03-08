class SummaryForecast
  attr_reader :summary,
              :temperature

  def initialize(data)
    # require 'pry'; binding.pry
    @summary = data[:current][:weather][0][:description]
    @temperature = data[:current][:temp]
  end
end