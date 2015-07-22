class UsersController < ApplicationController
  def index
    @users = User.all 
  end

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @topics = @user.topics
    redirect_to new_topic_path if @topics.length == 0
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end



private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password)
  end

end