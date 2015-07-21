class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :destroy]

  def create
    @question = Question.find_by(id: params[:question_id])
    @comment = @question.comments.build(comment_params)
    respond_to do |format|
      if @comment.save
        format.js
        format.html { redirect_to topic_path(@comment.question.topic), notice: 'comment was successfully created.' }
      else
        format.html { render partial: "new" }
        format.js { render 'create_errors.js'}
      end
    end
  end

  def update

  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.js
      format.html {redirect_to topic_path(@comment.question.topic)}
    end
  end

  private
    def set_comment
      @comment = Comment.find_by(id: params[:id])
    end

    def comment_params
      params.require(:comment).permit(:content, :author)
    end
end