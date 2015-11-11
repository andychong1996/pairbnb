class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :user_id
      t.string :home_type
      t.string :room_type
      t.integer :accommodates
      t.string :countries

      t.timestamps null: false
    end
  end
end
