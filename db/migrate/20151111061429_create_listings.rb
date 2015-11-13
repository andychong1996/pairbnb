class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :user_id
      t.string :title
      t.text :description
      t.decimal :price
      t.string :home_type
      t.string :room_type
      t.integer :accommodates
      t.string :country

      t.timestamps null: false
    end
  end
end
