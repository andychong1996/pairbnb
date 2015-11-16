class CreateListingsPhotos < ActiveRecord::Migration
  def change
    create_table :listings_photos do |t|
      t.integer :listing_id
      t.string :listing_photo
      t.timestamps null: false
    end
  end
end
