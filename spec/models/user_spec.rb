require 'spec_helper'

describe User do

  let(:username) { "Test User" }
  let(:password) { "alex" }
  let(:user) { User.new(username: username, password: password) } 


  it "should be able to create an account" do
    user.save
    User.last.username.should eq("Test User")
  end

  it "should be able to log in with a correct p/w" do 
    user.save
    expect ( 
      user.try(:authenticate, password) 
    ).should be_kind_of User
  end
  
end




