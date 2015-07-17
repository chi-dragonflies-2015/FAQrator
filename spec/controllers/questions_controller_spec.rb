require 'rails_helper'

describe QuestionsController do
  let!(:question) { create(:question) }


  pending "Get #edit" do
    it "assigns the requested question as @question" do
      get :edit, { id: question.to_param}
      expect(assigns(:question)).to eq(question)
    end
  end

  describe "POST #create" do
    context "when valid params are passed" do
      it "creates a new Question" do
        expect { post :create, question: {content: question.content }}.to change{ Question.all.count }.by(1)
      end

      it "assigns a newly created question as @question" do
        post :create, question: { content: question.content }
        expect(assigns(:question)).to eq(Question.last)
      end
    end
  end
  pending "PUT update" do
    context "when valid params are passed" do

      it "edits the current question" do
        expect { put :update, id: question.id, question: { content: question.content }}.to change{ Question.all.count }.by(0)
      end

      it "assigns a newly edited question as @question" do
        put :update, id: question.id, question: { content: question.content }
        expect(assigns(:question)).to eq(Question.last)
      end

      it "redirects to the edited question" do

       put :update, id: question.id, question: { content: question.content }
        expect(response).to redirect_to action: :show, id: assigns(:question).id
      end
    end

    context "when invalid params are passed" do
      it "assigns the accessed question as @question" do
        put :update, id: question.id, question: { content: nil }
        expect(assigns(:question).id).to eq question.id
      end

      it "re-renders the 'edit' template" do
        put :update, id: question.id, question: { content: nil }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE #destroy" do
    it "assigns the requested question as @question" do
      delete :destroy, { id: question.to_param }
      expect(assigns(:question)).to eq(question)
    end

    it "destroys the requested question" do
      expect {
        delete :destroy, id: question.id
      }.to change(Question, :count).by(-1)
    end
  end
end