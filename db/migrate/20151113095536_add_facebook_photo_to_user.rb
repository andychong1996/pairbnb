class AddFacebookPhotoToUser < ActiveRecord::Migration
  def change
    add_column :users, :facebook_photo, :string
  end
end
