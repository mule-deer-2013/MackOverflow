class Vote < ActiveRecord::Base

  attr_accessible :is_upvote, :votable_id, :votable_type, :user_id
  validate :only_vote
  validates :user_id, presence: true

  belongs_to :user
  belongs_to :question
  belongs_to :answer
  belongs_to :votable, polymorphic: true
  after_save :update_count

  def update_count
    self.votable.set_rating
  end

  def only_vote
    unless Vote.where(votable_id: self.votable_id, votable_type: self.votable_type, user_id: self.user_id).empty?
      errors.add(:vote, "You can only vote once per item")
    end
  end

end
