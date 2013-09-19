class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @questions = @user.questions.all
    @answers = @user.answers.all
  end

  def create
    p params
    @user= User.new(params)
    if @user.save
      redirect_to user_path  
    else
      flash[:notice] = @user.errors.full_messages  
      redirect_to root_path 
    end   
  end

  def new
    #create users/new.html.erb
  end

  # def edit
    
  # end

  # def update
    
  # end

end


# User.new(params)

# name = 'username' name = 'password'
# User.new(username: params[:username], password: params[:password])

# name = user[:username] name user[:psasword]
# User.new(params[:user])
