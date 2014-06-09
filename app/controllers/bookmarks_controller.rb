class BookmarksController < ApplicationController
  def index
    if current_user
      @bookmarks = Bookmark.all

      respond_to do |format|
        format.html
        format.json { render json: Bookmark.all } 
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
      flash[:notice] = "Story has been bookmarked successfully"
      redirect_to bookmarks_index
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    flash[:notice] = "Story has been deleted successfully"
    redirect_to bookmarks_index
  end

  private
    def bookmark_params
      params.require(:bookmark).permit(:title, :published, :source, :url, :team, :date_bookmarked)
    end
end