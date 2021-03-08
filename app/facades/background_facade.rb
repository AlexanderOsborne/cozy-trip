class BackgroundFacade
  class << self

    def image(location)
      location = UnsplashService.photo(location)
      image = Image.new(location)
    end
  end
end