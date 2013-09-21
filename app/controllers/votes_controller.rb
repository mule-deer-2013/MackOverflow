class VotesController < ApplicationController

  def create
    vote = Vote.new(is_upvote: params[:vote])
    q =Question.find(params[:questionId])
    q.votes << vote
    vote.save
    q.reload
    q.rating
    render json: {value: q.rating}
  end

end
