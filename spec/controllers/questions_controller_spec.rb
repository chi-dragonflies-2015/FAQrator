require 'rails_helper'

describe QuestionsController do
  let!(:topic) { create(:topic) }
  let!(:question) { create(:question) }

  describe "POST #create" do
    context "when valid params are passed" do
      it "creates a new Question" do
        expect { post :create, question: {content: question.content }, topic_id: topic.id}.to change{ Question.all.count }.by(1)
      end

      it "assigns a newly created question as @question" do
        post :create, question: { content: question.content }, topic_id: topic.id
        expect(assigns(:question)).to eq(Question.last)
      end
    end
  end

  describe "PUT update" do
    context "when valid params are passed" do

      it "edits the current question" do
        question.topic_id = topic.id
        question.save
        expect { put :update, id: question.id, question: { content: question.content } }.to change{ Question.all.count }.by(0)
      end

      it "assigns a newly edited question as @question" do
        question.topic_id = topic.id
        question.save
        put :update, id: question.id, question: { content: question.content }
        expect(assigns(:question)).to eq(Question.last)
      end

      it "redirects to the topics page containing the edited question" do
        question.topic_id = topic.id
        question.save
        put :update, id: question.id, question: { content: question.content }
        expect(response).to redirect_to assigns(:topic)
      end
    end

    context "when invalid params are passed" do
      it "assigns the accessed question as @question" do
        question.topic_id = topic.id
        question.save
        put :update, id: question.id, question: { content: nil }
        expect(assigns(:question).id).to eq question.id
      end
    end
  end

  describe "DELETE #destroy" do
    it "assigns the requested question as @question" do
        question.topic_id = topic.id
        question.save
      delete :destroy, { id: question.to_param }
      expect(assigns(:question)).to eq(question)
    end

    it "destroys the requested question" do
        question.topic_id = topic.id
        question.save
      expect {
        delete :destroy, id: question.id
      }.to change(Question, :count).by(-1)
    end
  end
end