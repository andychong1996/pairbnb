class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.integer :listing_id
      t.date :check_in_date
      t.date :check_out_date

      t.timestamps null: false
    end
  end
end
