class LikesController < ApplicationController
  
   def create
     @bookmark = Bookmark.find(params[:bookmark_id])
     like = current_user.likes.build(bookmark: @bookmark)
     @topic = @bookmark.topic
 
     if like.save
       flash[:success] = "Bookmark Liked"
       redirect_to :back
     else
       flash[:alert] = "Could not Like"
       redirect_to :back
     end
   end

   def destroy
     @bookmark = Bookmark.find(params[:bookmark_id])
     @user = current_user
     
     @topic = @bookmark.topic
     
     like = Like.find(params[:id])
 
     if like.destroy
       flash[:alert] = "Unliked"
       redirect_to :back
     else
       flash[:alert] = "Could not Unlike"
       redirect_to :back
     end
   end
  
end
