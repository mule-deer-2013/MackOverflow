require 'spec_helper'

describe QuestionsController do
  let(:valid_params)   { {:username => "Christian",
                          :password => "123456"} }
  describe 'GET index' do
    before {  get :index }
    it "assigns @questions" do
      expect(assigns(:questions_sorted_by_popularity)).to eq Question.all.sort_by { |question| question.answers.count }.reverse
    end

    it "renders index template" do
      expect(response).to render_template("index")
    end
  end

  describe 'GET new' do
    let(:user) { User.create(:username => "tlands",
                              :password => "123notit")}

    it "redirects if you're not signed in" do
      get :new
      expect(response).to redirect_to root_path
    end

    it "assigns @question when logged in" do
      controller.stub(:current_user) { true }
      get :new
      expect(assigns(:question)).to be_a_new Question
    end

    it "redirects if not logged in" do
      get :new
      response.should redirect_to root_path
    end
  end
end