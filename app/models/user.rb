class User < ActiveRecord::Base

  has_secure_password

  validates_presence_of :password, :on => :create
  validates :username, :uniqueness => true

  attr_accessible :username, :password
  has_many :questions
  has_many :answers
  has_many :votes
end
