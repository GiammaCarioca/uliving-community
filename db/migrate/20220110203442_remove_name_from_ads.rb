class RemoveNameFromAds < ActiveRecord::Migration[6.1]
  def change
    remove_column :ads, :name
  end
end
