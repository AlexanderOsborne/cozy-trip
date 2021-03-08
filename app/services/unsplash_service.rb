class UnsplashService
  class << self

    def photo(location)
      response = conn.get do |req|
        req.params['query'] = location
      end
    end

    private
    def conn
      @@conn ||= Faraday.new(:url => 'https://api.unsplash.com/photos/random') do |req|
        req.params['client_id'] = "#{ENV['UNSPLASH_KEY']}"
      end
    end
  end
end