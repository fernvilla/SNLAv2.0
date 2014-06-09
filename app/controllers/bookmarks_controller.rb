class BookmarksController < ApplicationController
  def index
    if current_user
      # @bookmarks = Bookmark.all
    else
      redirect_to new_user_session_path
      flash[:alert] = "Please sign in first"
    end
  end



  private
    def bookmark_params
      params.require(:bookmark).permit(:title, :published, :source, :url, :team, :date_bookmarked)
    end
end
