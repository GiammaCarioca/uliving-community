class AddCategoryToAds < ActiveRecord::Migration[6.1]
  def change
    add_column :ads, :category, :string
  end
end
