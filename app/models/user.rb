class User < ApplicationRecord
  attr_reader :name,
              :email,
              :password,
              :auth_token
  has_secure_token :auth_token
 
end
