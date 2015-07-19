require 'rails_helper'

describe TopicsController do
  let!(:topic) { create(:topic) }

  describe "GET #index" do
    it "assigns all topics as @topics" do
      get :index
      expect(assigns(:topics)).to eq(Topic.all)
    end
  end

  describe "GET #show" do
    it "assigns the requested topic as @topic" do
      get :show, { id: topic.to_param }
      expect(assigns(:topic)).to eq(topic)
    end

  end

  describe "Get #edit" do
    it "assigns the requested topic as @topic" do
      get :edit, { id: topic.to_param, edit_key: topic.edit_key}
      expect(assigns(:topic)).to eq(topic)
    end
  end

  describe "POST #create" do
    context "when valid params are passed" do

      it "creates a new Topic" do
        expect { post :create, topic: {title: topic.title, description: topic.description }}.to change{ Topic.all.count }.by(1)
      end

      it "assigns a newly created topic as @topic" do
        post :create, topic: {title: topic.title, description: topic.description }
        expect(assigns(:topic)).to eq(Topic.last)
      end

      it "redirects to the created topic" do
        post :create, topic: {title: topic.title, description: topic.description }
        expect(response).to redirect_to action: :edit, id: assigns(:topic).friendly_id, edit_key: assigns(:topic).edit_key
      end
    end

    context "when invalid params are passed" do
      it "assigns a newly created but unsaved topic as @topic" do
        post :create, topic: {title: nil, description: topic.description }
        expect(assigns(:topic)).to be_a_new(Topic)
      end

      it "re-renders the 'new' template" do
        post :create, topic: {title: nil, description: topic.description }
        expect(response).to render_template(:new)
      end
    end
  end
  describe "PUT update" do
    context "when valid params are passed" do

      it "edits the current topic" do
        expect { put :update, edit_key: topic.edit_key, id: topic.friendly_id, topic: {title: topic.title, description: topic.description }}.to change{ Topic.all.count }.by(0)
      end

      it "assigns a newly edited topic as @topic" do
        put :update, edit_key: topic.edit_key, id: topic.friendly_id, topic: {title: topic.title, description: topic.description }
        expect(assigns(:topic)).to eq(Topic.last)
      end

      it "redirects to the edited topic" do
        session[:edit_key] = topic.edit_key
        put :update, edit_key: topic.edit_key, id: topic.friendly_id, topic: {title: topic.title, description: topic.description }
        expect(response).to redirect_to action: :show, id: assigns(:topic).friendly_id
      end
    end

    context "when invalid params are passed" do
      it "assigns the accessed topic as @topic" do
        put :update, edit_key: topic.edit_key, id: topic.friendly_id, topic: {title: nil, description: topic.description }
        expect(assigns(:topic).id).to eq topic.id
      end

      it "re-renders the 'edit' template" do
        put :update, edit_key: topic.edit_key, id: topic.friendly_id, topic: {title: nil, description: topic.description }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE #destroy" do
    it "assigns the requested topic as @topic" do
      session[:edit_key] = topic.edit_key
      delete :destroy, { id: topic.to_param, edit_key: topic.edit_key }
      expect(assigns(:topic)).to eq(topic)
    end

    it "destroys the requested topic" do
      expect {
        session[:edit_key] = topic.edit_key
        delete :destroy, { id: topic.to_param, edit_key: topic.edit_key }
      }.to change(Topic, :count).by(-1)
    end

    it "redirects to the topic list" do
      session[:edit_key] = topic.edit_key
      delete :destroy, { id: topic.to_param, edit_key: topic.edit_key }
      expect(response).to redirect_to root_url
    end
  end
end