require 'spec_helper'

describe SessionsController do
  let!(:new_user) { User.create(:username => "tlands",
                                :password => "123notit")}

  describe "loggin in with valid user params" do
    it "should redirect to user path" do
      visit signin_path
      page.should have_content("Sign in")
      # fill_in 'Username', :with => "tlands"
      # fill_in 'Password', :with => "123notit"
      # click_button 'Sign In'
      # current_url.should eq user_path(new_user)
    end
  end
end