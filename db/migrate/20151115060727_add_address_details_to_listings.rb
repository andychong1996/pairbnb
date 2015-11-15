class AddAddressDetailsToListings < ActiveRecord::Migration
  def change
    add_column :listings, :address, :string
    add_column :listings, :city, :string
    add_column :listings, :state, :string
    add_column :listings, :postal_code, :string
    add_column :users, :home_page_url, :string
  end
end
