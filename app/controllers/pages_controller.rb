class PagesController < ApplicationController
  def home
    @content = Page.find_by(url: "home")

    @latest_ads = Ad.where("created_at > ?", 1.week.ago)

    @featured_ads = Ad.where(is_featured: true)
  end

  def about
    @content = Page.find_by(url: "about")
  end
end
