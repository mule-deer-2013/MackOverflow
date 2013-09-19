class User < ActiveRecord::Base

  has_secure_password
  
  validates_presence_of :password, :on => :create

  attr_accessible :username, :password
  has_many :questions #alias this
  has_many :answers #alias this

end
