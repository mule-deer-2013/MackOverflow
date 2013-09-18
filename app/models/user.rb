class User < ActiveRecord::Base

  attr_accessible :username, :password
  has_many :questions #alias this
  has_many :answers #alias this


  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def login(username, pass)
  @user = User.find_by_username(username)
    if @user.password == pass
      give_token
    else
      redirect_to home_url
    end
  end


  def give_token
    
  end

end
