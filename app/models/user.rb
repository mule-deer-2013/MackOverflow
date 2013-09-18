class User < ActiveRecord::Base

has_secure_password

  attr_accessible :username, :password
  has_many :questions #alias this
  has_many :answers #alias this


  # include BCrypt

  # def password
  #   @password ||= Password.new(password_hash)
  # end

  # def password=(new_password)
  #   @password = Password.create(new_password)
  #   self.password_hash = @password
  # end





  # def give_token
    
  # end

end
