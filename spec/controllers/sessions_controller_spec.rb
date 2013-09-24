require 'spec_helper'

describe SessionsController do
  let!(:user) { User.create(:username => "tlands",
                            :password => "123notit")}

  describe "logging in" do
    before(:each) { post :create, :session => { :username => "" } }
    context "logging in with invalid user params" do
      it "should redirect to user path" do
        controller.should_not_receive(:login)
      end

      it "should raise a flash notice error" do
        flash[:error].should_not be_nil
      end
    end

    context "logging in with valid user params" do
      it "should login the user" do
        controller.should receive(:login)
        post :create, :session => { :username => user.username,
                                    :password => user.password }
      end

      it "should redirect to user path" do
        post :create, :session => { :username => user.username,
                                    :password => user.password }
        page.should redirect_to user_path user                                    
      end
    end
  end

  describe "destroy" do
    it "should logout user" do
      controller.should receive(:logout)
      delete :destroy
    end
  end 
end