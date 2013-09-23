class VotesController < ApplicationController

  def create
    vote = Vote.new(is_upvote: params[:vote])
    q = params[:votableType].classify.constantize.find(params[:objectID])
    q.votes << vote
    vote.user_id = current_user.id
    vote.save
    q.reload
    q.rating
    render json: {value: q.rating}
  end
  
end
