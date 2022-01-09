class AddNameToAds < ActiveRecord::Migration[6.1]
  def change
    add_column :ads, :name, :string
  end
end
