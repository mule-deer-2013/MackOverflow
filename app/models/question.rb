class Question < ActiveRecord::Base
  attr_accessible :content
  belongs_to :user
  has_many :answers
  has_many :votes as: :votable

  validates_presence_of :content
end