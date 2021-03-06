class BookmarksController < ApplicationController
  
  def show
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
  end
  
  def new
    @bookmark = Bookmark.new
    @topic = Topic.find(params[:topic_id])
    authorize @bookmark
  end
  
  def create
    @bookmark= Bookmark.new(bookmark_params)
    @bookmark.user = current_user
    authorize @bookmark
    @topic = Topic.find(params[:topic_id])
    @bookmark.topic = @topic
    @user = current_user
    if @bookmark.save
      redirect_to topic_bookmark_path(@topic, @bookmark), notice: "Bookmark was added succesfully"
    else
      flash[:error] = "Error creating Bookmark"
      render :new
    end
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
    @topic = @bookmark.topic
    authorize @bookmark
  end
  
  def update
    @bookmark = Bookmark.find(params[:id])
    @topic = @bookmark.topic
    authorize @bookmark
    if @bookmark.update_attributes(bookmark_params)
      redirect_to @topic
    else
      flash[:error] = "Error saving Code. Please try again"
      render :edit
    end
  end
  
  def destroy
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
    if @bookmark.destroy
      flash[:notice] = "Bookmark was destroyed"
    else
      flash[:error] = "Error deleting Bookmark"
    end
    redirect_to :back
  end
  
  private
  
  def bookmark_params
    params.require(:bookmark).permit(:url)
  end

end
