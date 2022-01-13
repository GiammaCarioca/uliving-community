class AddStudioNumberToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :studio_number, :string
  end
end
