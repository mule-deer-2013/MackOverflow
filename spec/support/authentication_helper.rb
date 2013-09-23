module AuthenticationHelper

  def logged_in_test(user = true)
     ApplicationController.any_instance.stub(:logged_in?) { user }
  end
end