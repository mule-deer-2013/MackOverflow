class Vote < ActiveRecord::Base

  attr_accessible :is_upvote
  belongs_to :user
  belongs_to :question
  belongs_to :answer
  belongs_to :votable, polymorphic: true
  before_save :set_rating

  def set_rating(arrow_click)
    if arrow_click == true
      self.votable.rating += 1
    elsif arrow_click == false
      self.votable.rating -= 1
    end
  end

end
