class Question < ActiveRecord::Base
  attr_accessible :content, :rating, :user_id
  belongs_to :user
  has_many :answers

  validates_presence_of :content
end