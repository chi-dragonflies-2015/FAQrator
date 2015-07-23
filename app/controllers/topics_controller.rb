class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  def index
    @topics = params[:search] ? Topic.search(params[:search]) : Topic.all
  end

  def show
  	@questions = @topic.questions
    @creator = false
  end

  def new
  end

  def create
  	@topic = Topic.new(new_topic_params)
    @topic.user = current_user
  	if @topic.save

      redirect_to (topic_path(@topic) + '/' + @topic.edit_key), notice: "Edit your page at #{topic_url(@topic)}/#{@topic.edit_key}"
  	else
  	  render :new, notice: "Cannot be blank"
  	end
  end

  def search
    @topics = Topic.search(params[:search])

    if @topics.length == 0
      redirect_to topics_path, notice: 'No topics match that criteria.'
    end
  end

  def edit
    if edit_key_matches? || user_matches?
      @questions = @topic.questions
      session[:edit_key] = params[:edit_key]
      @creator = true
    else
      render status: 404
    end
  end

  def update
    set_topic
    if @topic.user && current_user && current_user == @topic.user
      session[:edit_key] = @topic.edit_key
    end

    if session_key_matches? && @topic.update_attributes(edit_topic_params)
      session[:edit_key] = nil
      redirect_to topic_path(@topic), notice: "Topic: #{@topic.title} has been updated."
    else
      render :edit
    end
  end

  def destroy
    set_topic
    if @topic.user && current_user && current_user == @topic.user
      session[:edit_key] = @topic.edit_key
    end

    if session_key_matches? 
      @topic.destroy
      session[:edit_key] = nil
      
      if current_user
        redirect_to user_path(current_user), notice: "Topic: #{@topic.title} has been deleted."
      else
        redirect_to root_url, notice: "Topic: #{@topic.title} has been deleted."
      end
    else
      render status: 404
    end
  end

private

  def new_topic_params
    params.require(:topic).permit(:title, :description, :primary_color)
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

  def user_matches?
    @topic.user.id ? session[:user_id] == @topic.user.id : false
  end
end