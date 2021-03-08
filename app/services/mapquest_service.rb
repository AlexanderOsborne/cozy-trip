class MapquestService
  class << self
    
    def coordinates(location)
      response = conn.get('/geocoding/v1/address') do |req|
        req.params['location'] = location
      end
      parsed = parser(response)
    end

  private
  def conn
    @@conn ||= Faraday.new(:url => 'http://www.mapquestapi.com') do |req|
      req.params['key'] = "#{ENV['GEOCODING_KEY']}"
    end
  end

  def parser(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
end