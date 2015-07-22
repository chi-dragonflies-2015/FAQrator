require 'rails_helper'

describe CommentsController do
  let!(:comment) { create(:comment) }
  let!(:question) { create(:question) }
  describe "POST #create" do
    context "when valid params are passed" do

      it "creates a new Comment" do
        expect { post :create, question_id: question.id, comment: {content: comment.content }}.to change{ Comment.all.count }.by(1)
      end

      it "assigns a newly created comment as @comment" do
        post :create, question_id: question.id, comment: { content: comment.content }
        expect(assigns(:comment)).to eq(Comment.last)
      end

      it "renders the comment when xhr" do
        xhr :post, :create, question_id: question.id, comment: { content: comment.content }
        expect(response.code).to eq "200"

      end

      it "redirects to the created comment when not XHR" do
        post :create, question_id: question.id, comment: { content: comment.content }
        expect(response).to redirect_to topic_path(question.topic)
      end
    end

    context "when invalid params are passed" do
      it "assigns a newly created but unsaved comment as @comment" do
        post :create, question_id: question.id, comment: { content: nil }
        expect(assigns(:comment)).to be_a_new(Comment)
      end

      it "re-renders the 'new' template" do
        post :create, question_id: question.id, comment: { content: nil }
        expect(response).to render_template(:"_new")
      end
    end
  end
  describe "PUT update" do
    context "when valid params are passed" do

      it "edits the current comment" do
        expect { put :update, id: comment.id, comment: { response: "test response" }}.to change{ Comment.all.count }.by(0)
      end

      it "assigns a newly edited comment as @comment" do
        put :update, id: comment.id, comment: { response: "test response" }
        expect(assigns(:comment)).to eq(Comment.last)
      end

      it "redirects to the edited comment" do

       put :update, id: comment.id, comment: { content: comment.content }
        expect(response.status).to eq 302
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

    it "responds correctly when destroying as XHR" do
      xhr :delete, :destroy, id: comment.to_param
      expect(response.code).to eq "200"
    end

    it "redirects to the comment list if not XHR" do
      delete :destroy, { id: comment.to_param }
      expect(response).to redirect_to topic_path(comment.question.topic)
    end
  end
end