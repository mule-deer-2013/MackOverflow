class Vote < ActiveRecord::Base

  belongs_to :user
  belongs_to :question
  belongs_to :answer
  belongs_to :votable, polymorphic: true

end