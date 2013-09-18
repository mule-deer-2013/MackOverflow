require 'spec_helper'

describe User do

  let(:user) { User.new(username: username) } 
  let(:username) { "Test User" }


  it "should be able to create an account" do
    user.save
    User.last.username.should eq "Test User"
  end

  it "should be able to log in" do 
    pending
  end


end




