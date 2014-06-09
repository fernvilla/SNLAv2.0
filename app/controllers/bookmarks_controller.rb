class BookmarksController < ApplicationController
  def index
    if current_user
      @bookmarks = Bookmark.all

      respond_to do |format|
        format.html
        format.json { render json: current_user.bookmarks } 
      end
    else
      redirect_to new_user_session_path
      flash[:alert] = "Please sign in first"
    end
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.user = current_user

    if @bookmark.save
      flash[:notice] = "Link has been bookmarked successfully"
      redirect_to bookmarks_path
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy

    flash[:notice] = "Link has been deleted successfully"
    redirect_to bookmarks_path
  end

  private
    def bookmark_params
      params.permit(:title, :published, :source, :url, :team, :date_bookmarked, :user_id)
    end
end