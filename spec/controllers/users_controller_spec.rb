require 'rails_helper'

describe UsersController do

  describe "users#create" do
    context "when valid params are passed" do

      it "creates a new User" do     
        expect { post :create, user: FactoryGirl.attributes_for(:user) }.to change{ User.all.count }.by(1)
      end

      it "assigns a newly created user as @user" do
        post :create, user: FactoryGirl.attributes_for(:user)
        expect(assigns(:user)).to eq(User.last)
      end

      it "redirects to the created user's page" do
        post :create, user: FactoryGirl.attributes_for(:user)
        expect(response).to redirect_to action: :show, id: assigns(:user).id
      end
    end

    context "when invalid params are passed" do
      it "assigns a newly created but unsaved user as @user" do
        post :create, user: {first_name: "Lana", last_name:"Lane", username: "Me" }
        expect(assigns(:user)).to be_a_new(User)
      end

      it "does not save the new User" do     
        expect { post :create, user: {first_name: "Lana", last_name:"Lane", username: "Me" } }.to change{ User.all.count }.by(0)
      end

      it "renders the 'new' template" do
        post :create, user: {first_name: "Lana", last_name:"Lane", username: "Me" } 
        expect(response).to render_template(:new)
      end
    end
  end


  describe "users#show" do
  
      it "assigns a user as @user" do
        user =  FactoryGirl.create(:user)
        session[:user_id] = user.id
        get :show, id: user.id
        expect(assigns(:user)).to eq(user)
      end

      it "assigns user's topics as @topics" do 
        user =  FactoryGirl.create(:user)
        session[:user_id] = user.id
        get :show, id: user.id
        expect(assigns(:topics)).to eq(user.topics)
      end

  end

end