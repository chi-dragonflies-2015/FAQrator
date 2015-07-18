class TopicsController < ApplicationController
  def index
  	@topics = Topic.all
  end

  def show
  	@topic = Topic.friendly.find(params[:id])
  	# @questions = @topic.questions
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
  	@topic = Topic.friendly.find(params[:id])

  	if edit_key_matches?
      session[:edit_key] = params[:edit_key]
    else
      render_404
    end
  end

  def update
   @topic = Topic.friendly.find(params[:id])

   if session_key_matches? && @topic.update_attributes(topic_params)
      flash[:success] = "Article Updated"
      session[:edit_key] = nil
      redirect_to topic_path(@topic)
    else
      render :edit
    end
  end





private

  def topic_params
    params.require(:topic).permit(:title, :description)
  end

  def edit_key_matches?
    @topic.edit_key == params[:edit_key]
  end

  def session_key_matches?
    @topic.edit_key == session[:edit_key]
  end

end