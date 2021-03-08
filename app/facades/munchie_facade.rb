class MunchieFacade
  class << self

    def munchie(data)
      munchie = Munchie.new(data)
    end
  end
end