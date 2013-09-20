class Question < ActiveRecord::Base
  attr_accessible :content
  belongs_to :user
  has_many :answers
  has_many :votes, as: :votable
  validates_presence_of :content


  def set_rating(arrow_click)

    arrow_click ? self.rating += 1 : self.rating -= 1

  end

end
