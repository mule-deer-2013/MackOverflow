class Question < ActiveRecord::Base
  attr_accessible :content, :rating, :user_id, :tag_list
  validates :user_id, presence: true

  belongs_to :user
  has_many :answers
  has_many :taggings
  has_many :tags, through: :taggings
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

  def tag_list
    tags.join(', ')
  end

  def tag_list=(tags_string)
    tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
    new_or_found_tags = tag_names.collect { |name| Tag.create(name: name) }
    self.tags = new_or_found_tags
  end

end
