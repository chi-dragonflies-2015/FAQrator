class SubscriptionsController < ApplicationController

  def create
    puts params[:topic]
    topic = Topic.find(params[:topic_id])
    current_user.star(topic)
    redirect_to topic_path(topic)
  end

  def destroy
    topic = Subscription.find(params[:id]).topic
    current_user.unstar(topic)
    redirect_to topic_path(topic)
  end
end