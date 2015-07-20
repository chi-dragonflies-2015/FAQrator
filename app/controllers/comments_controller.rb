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
    puts "request is xhr? #{ request.xhr?}"
    @question = Question.find_by(id: params[:question_id])
    @comment = @question.comments.build(comment_params)
    if @comment.save
      if request.xhr?
        puts "AJAXY!"
        render :"comments/_comment", locals: {comment: @comment}, layout: false
      else
        puts "NOT AJAXY!"
        redirect_to "/topics/#{@question.topic.slug}"
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
      render json: @question
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