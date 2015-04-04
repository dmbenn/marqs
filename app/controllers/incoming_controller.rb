class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_action :verify_authenticity_token, only: [:create]

  def create

    # You put the message-splitting and business
    # magic here. 
    
    @user = User.where(email: params[:sender]).take
    @url = params["body-plain"]
    
    if @user.nil?
      @user = User.create(email: params[:sender], password: params[:sender])
    end
    
    @topic = Topic.where(title: params[:subject], user: @user).take
    
    if @topic.nil?
      @topic = Topic.create(title: params[:subject], user: @user)
    end
    
    @bookmark = Bookmark.create(url: @url, topic: @topic)
    
    # Find the user by using params[:sender]
    # Find the topic by using params[:subject]
    # Assign the url to a variable after retreiving it from params["body-plain"]

    # Check if user is nil, if so, create and save a new user

    # Check if the topic is nil, if so, create and save a new topic

    # Now that we're sure we have a valid user and topic, build and save a new bookmark


    # Assuming all went well. 
    head 200
  end
end