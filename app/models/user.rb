class User < ActiveRecord::Base

  attr_accessible :username
  has_many :questions #alias this
  has_many :answers #alias this


end
