class Answer < ActiveRecord::Base
  attr_accessible :content
  belongs_to :user
  belongs_to :question
  has_many :votes, as: :votable

  validates_presence_of :content

end
