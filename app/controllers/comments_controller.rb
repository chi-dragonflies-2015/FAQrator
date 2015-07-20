class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :destroy]

  def create
    puts "request is xhr? #{ request.xhr?}"
    @question = Question.find_by(id: params[:question_id])
    @comment = @question.comments.build(comment_params)
    if @comment.save
      if request.xhr?
        puts "AJAXY!"
        render json: @comment
      else
        puts "NOT AJAXY!"
        redirect_to questions_url, notice: 'comment was successfully created.'
      end
    else
      render :"_new", locals: {question: @question}
    end
  end

  def update

  end

  def destroy
    @comment.destroy
    if request.xhr?
      render text: "deleted"
    else
      redirect_to "/questions"
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