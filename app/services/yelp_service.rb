class YelpService
  class << self

    def search(data)
      # require 'pry'; binding.pry
      response = conn.get('/v3/businesses/search') do |req|
        req.params['location'] = data[:destination]
        req.params['term'] = data[:food]
        req.params['categories'] = "food"
        req.params['limit'] = 1
      end
      parsed = parser(response)
    end

    private
    def conn
      @@conn ||= Faraday.new(:url => 'https://api.yelp.com') do |req|
        req.headers['Authorization'] = "Bearer #{ENV['YELP_KEY']}"
      end
    end

    def parser(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end