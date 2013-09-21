class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user= User.new(params[:user])
    if @user.save
      login(@user)
      redirect_to @user
    else
      flash[:notice] = @user.errors.full_messages  
      redirect_to new_user_path 
    end   
  end

  def show
    @user = User.find(params[:id])
    @questions = @user.questions.all
    @answers = @user.answers.all
  end



  # def edit
    
  # end

  # def update
    
  # end

end

