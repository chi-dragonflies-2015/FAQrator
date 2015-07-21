class QuestionsController < ApplicationController

  def create
    @topic = Topic.find(params[:topic_id])
    @question = @topic.questions.build(question_params)
    respond_to do |format|
      if @question.save
        format.js
        format.html { redirect_to topic_path(@topic)}
      else
        format.js { render "create_errors.js"}
        format.html { redirect_to topic_path(@topic), notice: "question cannot be blank" }

      end
    end
  end

  def update
    @question = Question.find(params[:id])
    @topic = @question.topic
    respond_to do |format|
      if @question.update_attributes(question_params)
        format.js {render "answer.js"}
        format.html { redirect_to topic_path(@topic)}
      else
        render :_question
      end
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @topic = @question.topic
    @question.destroy
    @questions = @topic.questions
    @creator = true
    respond_to do |format|
      format.js
      format.html {redirect_to topic_path(@topic)}
    end
  end

private

  def question_params
    params.require(:question).permit(:content, :answer)
  end

end