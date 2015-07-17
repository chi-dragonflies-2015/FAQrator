class QuestionsController < ApplicationController

  def show
    @questions = Question.all
    render :_questions
  end

  def create
    @question = Question.create(question_params)
    redirect_to "/questions"
  end

  def destroy

  end

private

  def question_params
    params.require(:question).permit(:content, :answer)
  end

end