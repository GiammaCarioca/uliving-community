class RemoveStudioFromAds < ActiveRecord::Migration[6.1]
  def change
    remove_column :ads, :studio
  end
end
