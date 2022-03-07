class TestimonialsController < ApplicationController
  def create
    @user = User.find_by(username: params[:user_id])

    @testimonial = Testimonial.new(params.require(:testimonial).permit(:body, :author_id, :receiver_id))

    @testimonial.author_id = @current_user.id
    @testimonial.receiver_id = @user.id

    @testimonial.save

    flash[:success] = 'Your testimonial was posted!'

    # go back to the user show page
    redirect_to user_path(@user)
  end
end
