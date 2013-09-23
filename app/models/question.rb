class Question < ActiveRecord::Base
  attr_accessible :content, :rating, :user_id
  validates :user_id, presence: true

  belongs_to :user
  has_many :answers
  has_many :votes, as: :votable
  validates_presence_of :content

  def set_rating
    q = self
    upvote_count = q.votes.where(:is_upvote => true).count
    downvote_count = q.votes.where(:is_upvote => false).count
    q.rating = upvote_count - downvote_count
    q.save
    p q.rating
  end

end
