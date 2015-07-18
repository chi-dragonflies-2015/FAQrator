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
      @topic.edit_key = SecureRandom.urlsafe_base64(6)
      redirect_to topic_path(@topic)
  	else
  	  render :new
  	end
  end

private

  def topic_params
    params.require(:topic).permit(:title, :description)
  end

end