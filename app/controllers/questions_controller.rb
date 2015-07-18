class QuestionsController < ApplicationController

  def index
    @questions = Question.all
    render :_questions
  end

  def show

  end

  def create
    @topic = Topic.find(params[:topic_id])
    @question = Question.create(question_params)
    @question.topic_id = @topic.id
    @question.save

    if request.xhr?
      render partial: "question", locals: {question: @question}
    else
      redirect_to "/topics/#{@topic.slug}"
    end
  end

  def update
    @question = Question.find(params[:id])
    @topic = @question.topic
    @question.update_attributes(question_params)

    if request.xhr?
      render json: @question
    else
      redirect_to "/topics/#{@topic.slug}"
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @topic = @question.topic
    @question.destroy

    if request.xhr?
      render json: @question
    else
      redirect_to "/topics/#{@topic.slug}"
    end
  end

private

  def question_params
    params.require(:question).permit(:content, :answer)
  end

end