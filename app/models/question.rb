class Question < ActiveRecord::Base
  attr_accessible :content, :rating, :user_id
  validates :user_id, presence: true

  belongs_to :user
  has_many :answers
  has_many :votes, as: :votable
  validates_presence_of :content

  def set_rating
    upvote_count = self.votes.where(:is_upvote => true).count
    downvote_count = self.votes.where(:is_upvote => false).count
    self.rating = upvote_count - downvote_count
    self.save
  end

end
