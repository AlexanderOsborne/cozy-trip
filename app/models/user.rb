class User < ApplicationRecord
  attr_reader :name,
              :email,
              :password,
              :auth_token
  has_secure_token :auth_token

  def initialize(data)
    @email = data[:email]
    @password = data[:password]
    @auth_token = generate_token
    require 'pry'; binding.pry
  end  

  private
  def set_access_token
    self.auth_token = generate_token
  end

  def generate_token
    loop do
      token = SecureRandom.hex(10)
      break token unless User.where(auth_token: token).exists?
    end
  end
end
