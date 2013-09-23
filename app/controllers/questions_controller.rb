class QuestionsController < ApplicationController

  def index
    @questions_sorted_by_popularity = Question.all.sort_by { |question| question.answers.count }.reverse
    @questions = @questions_sorted_by_popularity.each
  end

  def new
    if logged_in?
      @question = Question.new
    else
      redirect_to root_path
    end
  end

  def create
    @question = Question.new(params[:question])
    @question.user = current_user
    if @question.save
      redirect_to @question
    else
      render 'new'
    end
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
  end
end




