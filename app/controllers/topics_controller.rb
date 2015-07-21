class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  def index
  	@topics = Topic.all
  end

  def show
  	@questions = @topic.questions
    @creator = false
  end

  def new
  end

  def create
  	@topic = Topic.new(new_topic_params)

  	if @topic.save

      redirect_to (topic_path(@topic) + '/' + @topic.edit_key), notice: "Edit your page at #{topic_url(@topic)}/#{@topic.edit_key}"
  	else
  	  render :new, notice: "cant be blank"
  	end
  end

  def edit
    if edit_key_matches?
      @questions = @topic.questions
      session[:edit_key] = params[:edit_key]
      @creator = true
    else
      render status: 404
    end
  end

  def update
    if session_key_matches? && @topic.update_attributes(edit_topic_params)
      flash[:success] = "Article Updated"
      session[:edit_key] = nil
      redirect_to topic_path(@topic)
    else
      render :edit
    end
  end

  def destroy
    if session_key_matches?
      @topic.destroy
      flash[:success] = "Article deleted"
      session[:edit_key] = nil
      redirect_to root_url
    else
      render status: 404
    end
  end

private

  def new_topic_params
    params.require(:topic).permit(:title, :description)
  end

  def edit_topic_params
    params.require(:topic).permit(:description)
  end

  def set_topic
  	@topic = Topic.friendly.find(params[:id])
  end

  def edit_key_matches?
    @topic.edit_key == params[:edit_key]
  end

  def session_key_matches?
    @topic.edit_key == session[:edit_key]
  end

end