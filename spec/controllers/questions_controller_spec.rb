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

      it "renders a partial when an XHR request" do
        xhr :post, :create, question: { content: question.content}, topic_id: topic.id
        expect(response.code).to eq "200"
        expect(response).to render_template("_question")
      end
    end

    context "when invalid params are passed" do
      it "renders the new partial" do
        post :create, question: { content: nil }, topic_id: topic.id
        expect(response).to render_template("_new")
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

      it "renders JSON correctly when handling an XHR request" do
        question.topic_id = topic.id
        question.save
        xhr :put, :update, id: question.id, question: { content: question.content }
        expect(response.code).to eq "200"
        json = JSON.parse(response.body)
        expect(json['content']).to eq question.content
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

    it "responds correctly when destroying as XHR" do
      question.topic_id = topic.id
      question.save
      xhr :delete, :destroy, id: question.to_param
      expect(response.code).to eq "200"
      expect(response.body).to eq "deleted"
    end

    it "redirects to the question list if not XHR" do
      delete :destroy, { id: question.to_param }
      expect(response).to redirect_to questions_url
    end
  end
end