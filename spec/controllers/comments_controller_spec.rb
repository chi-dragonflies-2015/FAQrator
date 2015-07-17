require 'rails_helper'

describe CommentsController do
  let!(:comment) { create(:comment) }

  describe "GET #index" do
    it "assigns all comments as @comments" do
      get :index
      expect(assigns(:comments)).to eq(Comment.all)
    end
  end

  describe "GET #show" do
    it "assigns the requested comment as @comment" do
      get :show, { id: comment.to_param }
      expect(assigns(:comment)).to eq(comment)
    end

  end

  describe "GET #new" do
    it "assigns a new comment" do
      get :new
      expect(assigns(:comment)).to be_a_new(Comment)
    end
  end

  pending "Get #edit" do
    it "assigns the requested comment as @comment" do
      get :edit, { id: comment.to_param}
      expect(assigns(:comment)).to eq(comment)
    end
  end

  describe "POST #create" do
    context "when valid params are passed" do

      it "creates a new Comment" do
        expect { post :create, comment: {content: comment.content }}.to change{ Comment.all.count }.by(1)
      end

      it "assigns a newly created comment as @comment" do
        post :create, comment: { content: comment.content }
        expect(assigns(:comment)).to eq(Comment.last)
      end

      it "redirects to the created comment" do
        post :create, comment: { content: comment.content }
        expect(response).to redirect_to action: :show, id: assigns(:comment).id
      end
    end

    context "when invalid params are passed" do
      it "assigns a newly created but unsaved comment as @comment" do
        post :create, comment: { content: nil }
        expect(assigns(:comment)).to be_a_new(Comment)
      end

      it "re-renders the 'new' template" do
        post :create, comment: { content: nil }
        expect(response).to render_template(:new)
      end
    end
  end
  pending "PUT update" do
    context "when valid params are passed" do

      it "edits the current comment" do
        expect { put :update, id: comment.id, comment: { content: comment.content }}.to change{ Comment.all.count }.by(0)
      end

      it "assigns a newly edited comment as @comment" do
        put :update, id: comment.id, comment: { content: comment.content }
        expect(assigns(:comment)).to eq(Comment.last)
      end

      it "redirects to the edited comment" do

       put :update, id: comment.id, comment: { content: comment.content }
        expect(response).to redirect_to action: :show, id: assigns(:comment).id
      end
    end

    context "when invalid params are passed" do
      it "assigns the accessed comment as @comment" do
        put :update, id: comment.id, comment: { content: nil }
        expect(assigns(:comment).id).to eq comment.id
      end

      it "re-renders the 'edit' template" do
        put :update, id: comment.id, comment: { content: nil }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE #destroy" do
    it "assigns the requested comment as @comment" do
      delete :destroy, { id: comment.to_param }
      expect(assigns(:comment)).to eq(comment)
    end

    it "destroys the requested comment" do
      expect {
        delete :destroy, id: comment.id
      }.to change(Comment, :count).by(-1)
    end

    it "redirects to the comment list" do
      delete :destroy, { id: comment.to_param }
      expect(response).to redirect_to action: :index
    end
  end
end