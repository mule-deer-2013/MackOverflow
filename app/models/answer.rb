class Answer < ActiveRecord::Base
  attr_accessible :content
  belongs_to :user
  belongs_to :question

  validates_presence_of :content

end