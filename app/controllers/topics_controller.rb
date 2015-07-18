class TopicsController < ApplicationController
  def index
  	@topics = Topic.all
  end

  def show
  	@topic = Topic.friendly.find(params[:id])
  	# @questions = @topic.questions
  end

 

end