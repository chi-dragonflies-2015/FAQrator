class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  def index
  	@topics = Topic.all
  end

  def show
  	@questions = @topic.questions
  end

  def new
  end

  def create
  	@topic = Topic.new(topic_params)

  	if @topic.save
      redirect_to topic_path(@topic), notice: 'Topic was successfully created.'
  	else
  	  render :new
  	end
  end

  def edit
    if edit_key_matches?
      @questions = @topic.questions
      session[:edit_key] = params[:edit_key]
    else
      render_404
    end
  end

  def update
    if session_key_matches? && @topic.update_attributes(topic_params)
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
      render_404
    end
  end

private

  def topic_params
    params.require(:topic).permit(:title, :description)
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