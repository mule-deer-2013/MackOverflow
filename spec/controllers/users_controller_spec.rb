require 'spec_helper'

describe UsersController  do
  let(:valid_params)   { {:username => "Christian",
                          :password => "123456"} }
  
  let(:invalid_params) { {:username => "Tyle Durdan",
                          :password => ''}} 

  describe 'GET new' do
    it "initializes a new user" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe 'POST create' do  
    context "valid params" do
      it 'creates a new user' do
        expect {
          post :create, user: valid_params
        }.to change{ User.count }.by(1)
      end

      it "redirects to the show template" do
        post :create, user: valid_params
        response.should redirect_to user_path(User.last)
      end
    end
    context "invalid params" do
      it "does not create a new user" do
        expect {
          post :create, user: invalid_params
        }.to_not change{ User.count }
      end
      
      it "redirects to new user route " do
        post :create, user: invalid_params
        response.should redirect_to new_user_path
      end
    end
  end

  describe 'GET show' do
    let(:christian) { User.create(valid_params) }
    before(:each) { get :show, id: christian.id }

    it 'assigns @user' do
      expect(assigns(:user)).to eq christian
    end

    it 'assigns @questions' do
      expect(assigns(:questions)).to eq christian.questions
    end


    it 'assigns @questions' do
      expect(assigns(:answers)).to eq christian.answers
    end
  end








end