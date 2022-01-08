class AdsController < ApplicationController

  def index

    @category = params[:category]

    if @category.present?
      #filter by category (request or offer)
      @ads = Ad.where(category: @category)
    else
      @ads = Ad.all
    end

  end

  def new
    @ad = Ad.new
  end

  def create
    @ad = Ad.new(form_params)

    if @ad.save
      redirect_to root_path
    else
      # show the view for new.html.erb
      render "new"
    end

  end

  def show
    @ad = Ad.find(params[:id])
  end

  def destroy
    @ad = Ad.find(params[:id])

    @ad.destroy

    redirect_to root_path
  end

  def edit
    @ad = Ad.find(params[:id])
  end

  def update
    @ad = Ad.find(params[:id])

    if @ad.update(form_params)
      redirect_to ad_path(@ad)
    else
      render "edit"
    end

  end

  def form_params
    params.require(:ad).permit(:title, :body, :studio, :category, :phone_number)
  end

end
