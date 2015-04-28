class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_bookmarks = Bookmark.where(user: @user)
     # populate @liked_bookmarks with liked bookmarks
    @liked_bookmarks = []
    @likes = Like.where(user: @user)
      @likes.each do |like|
        @liked_bookmarks << like.bookmark
      end
  end
end
