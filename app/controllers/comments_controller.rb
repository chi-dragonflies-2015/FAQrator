class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :destroy]

  def index
    @comments = Comment.all
  end

  def show

  end

  def new
    @comment = Comment.new
  end

  def create
    @question = Question.find_by(id: params[:question_id])
    @comment = @question.comments.build(comment_params)
    if @comment.save
      if request.xhr?
        render json: @comment
      else
        redirect_to questions_url, notice: 'comment was successfully created.'
      end
    else
      render :new
    end
  end

  def destroy
    @comment.destroy
    redirect_to comments_url, notice: 'Comment was successfully destroyed.'
  end
  private
    def set_comment
      @comment = Comment.find_by(id: params[:id])
    end

    def comment_params
      params.require(:comment).permit(:content, :author)
    end
end