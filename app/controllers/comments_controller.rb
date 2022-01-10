class CommentsController < ApplicationController

  def create

    @ad = Ad.find(params[:ad_id])

    @comment = @ad.comments.new(params.require(:comment).permit(:body))

    @comment.user = @current_user

    @comment.save

    # go back to the ad show page
    redirect_to ad_path(@ad)

  end

end
