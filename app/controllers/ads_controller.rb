class AdsController < ApplicationController
  def index
    @category = params[:category]

    @ads = if @category.present?
             # filter by category (request or offer)
             Ad.where(category: @category)
           else
             Ad.all
           end
  end

  def new
    @ad = Ad.new
  end

  def create
    @ad = Ad.new(form_params)

    # and then associate it with a user
    @ad.user = @current_user

    if @ad.save
      flash[:success] = 'Your ad was posted!'

      redirect_to root_path
    else
      # show the view for new.html.erb
      render 'new'
    end
  end

  def show
    @ad = Ad.find(params[:id])
  end

  def destroy
    @ad = Ad.find(params[:id])

    # destroy if they have access
    if @ad.user == @current_user
      @ad.destroy

      flash[:success] = 'Ad deleted successfully!'
    end

    # redirect to the home page
    redirect_to root_path
  end

  def edit
    @ad = Ad.find(params[:id])

    redirect_to root_path if @ad.user != @current_user
  end

  def update
    @ad = Ad.find(params[:id])

    if @ad.user != @current_user
      redirect_to root_path
    elsif @ad.update(form_params)
      flash[:success] = 'Ad updated successfully!'

      redirect_to ad_path(@ad)
    else
      render 'edit'
    end
  end

  def form_params
    params.require(:ad).permit(:title, :body, :category)
  end
end
