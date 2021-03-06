class OpenweatherService
  class << self

    def forcast(coordinates)
      response = conn.get do |req|
        # require 'pry'; binding.pry
        req.params['lat'] = coordinates[0].latitude
        req.params['lon'] = coordinates[0].longitude
        req.params['exclude'] = "alerts"
      end
      parsed = parser(response)
    end

  private
  def conn
    @@conn ||= Faraday.new(:url => 'https://api.openweathermap.org/data/2.5/onecall') do |req|
      req.params['appid'] = "#{ENV['OPENWEATHER_KEY']}"
    end
  end

  def parser(response)
    JSON.parse(response.body, symbolize_names: true)
  end
  end
end