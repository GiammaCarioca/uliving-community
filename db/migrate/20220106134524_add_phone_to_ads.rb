class AddPhoneToAds < ActiveRecord::Migration[6.1]
  def change
    add_column :ads, :phone_number, :string
  end
end
