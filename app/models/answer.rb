class Answer < ActiveRecord::Base
  attr_accessible :content, :user_id, :rating
  belongs_to :user
  belongs_to :question

  validates_presence_of :content

end