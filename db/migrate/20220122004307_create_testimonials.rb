class CreateTestimonials < ActiveRecord::Migration[6.1]
  def change
    create_table :testimonials do |t|
      t.text :body
      t.references :author, null: false
      t.references :receiver, null: false

      t.timestamps
    end

    add_foreign_key :testimonials, :users, column: :author_id
    add_foreign_key :testimonials, :users, column: :receiver_id
  end
end
