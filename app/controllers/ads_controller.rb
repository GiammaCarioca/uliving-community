class AdsController < ApplicationController

  def index
    @ads = Ad.all
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
    params.require(:ad).permit(:title, :body, :studio)
  end

end
