class TopicsController < ApplicationController
  def index
    if user_signed_in?
      @user = current_user
      @topics = current_user.topics
      @topic = Topic.new
    else
      flash[:alert] = "Please Login"
      redirect_to new_user_session_path
    end
  end

  def show
    @topic = Topic.find(params[:id])
    @bookmarks = @topic.bookmarks
  end

   def create
    @topic = Topic.new(topic_params)
    @user = current_user
    @topic.user = @user
    if @topic.save
      redirect_to topics_path, notice: "Topic was added succesfully"
    else
      flash[:error] = "Error creating Topic"
      render :index
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    if @topic.destroy
      flash[:notice] = "Topic was destroyed"
    else
      flash[:error] = "Error deleting topic"
    end
    redirect_to topics_path
  end
      
  private
  
  def topic_params
    params.require(:topic).permit(:title)
  end
  
end
