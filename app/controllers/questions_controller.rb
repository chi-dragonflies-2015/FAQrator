class QuestionsController < ApplicationController

  def index
    @questions = Question.all
    render :_questions
  end

  def show

  end

  def create
    @question = Question.create(question_params)

    if request.xhr?
      render partial: "question", locals: {question: @question}
    else
      redirect_to "/questions"
    end
  end

  def update
    @question = Question.find(params[:id])
    @question.update_attributes(question_params)

    if request.xhr?
      render json: @question
    else
      redirect_to "/questions"
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    if request.xhr?
      render json: @question
    else
      redirect_to "/questions"
    end
  end

private

  def question_params
    params.require(:question).permit(:content, :answer)
  end

end