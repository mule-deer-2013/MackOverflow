require 'test_helper'

class QuestionrsControllerTest < ActionController::TestCase
  setup do
    @questionr = questionrs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:questionrs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create questionr" do
    assert_difference('Questionr.count') do
      post :create, questionr: {  }
    end

    assert_redirected_to questionr_path(assigns(:questionr))
  end

  test "should show questionr" do
    get :show, id: @questionr
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @questionr
    assert_response :success
  end

  test "should update questionr" do
    put :update, id: @questionr, questionr: {  }
    assert_redirected_to questionr_path(assigns(:questionr))
  end

  test "should destroy questionr" do
    assert_difference('Questionr.count', -1) do
      delete :destroy, id: @questionr
    end

    assert_redirected_to questionrs_path
  end
end
