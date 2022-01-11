class BookmarksController < ApplicationController

  before_action :check_login

  def create
    # find the ad we're bookmarking
    @ad = Ad.find(params[:ad_id])

    @bookmark = @ad.bookmarks.new
    @bookmark.user = @current_user

    @bookmark.save

    # go back to the review page
    redirect_to ad_path(@ad)

  end

  def destroy
    
    @ad = Ad.find(params[:ad_id])

    @ad.bookmarks.where(user: @current_user).delete_all

    redirect_to ad_path(@ad)

  end

end
