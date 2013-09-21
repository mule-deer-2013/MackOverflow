class QuestionsController < ApplicationController

  def index
    @questions = Question.all
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




