class User < ActiveRecord::Base
  has_many :questions #alias this
  has_many :answers #alias this

end