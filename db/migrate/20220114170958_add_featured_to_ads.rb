class AddFeaturedToAds < ActiveRecord::Migration[6.1]
  def change
    add_column :ads, :is_featured, :boolean, default: false
  end
end
