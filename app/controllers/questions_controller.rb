class QuestionsController < ApplicationController

  def show
    @questions = Question.all
    render :_questions
  end

  def create

  end

  def destroy

  end

end