require 'spec_helper'

describe QuestionsController do
  let(:valid_params)   { {:username => "Christian",
                          :password => "123456"} }
  describe 'GET index' do
    before {  get :index }
    it "assigns @questions" do
      expect(assigns(:questions)).to eq Question.all
    end

    it "renders index template" do
      expect(response).to render_template("index")
    end
  end

  describe 'GET new' do
    let!(:user) { User.create(:username => "tlands",
                              :password => "123notit")}
    before { get :new }
    it "redirects if you're not signed in" do
      expect(response).to redirect_to root_path
    end

    it "assigns @question when logged in" do
      logged_in_test user # doesn't work!
      expect(assigns(:question)).to be_a_new Question
    end

    it "redirects if not logged in" do
      expect(response).to redirect_to root_path
    end
  end
end