class ListingsPhoto < ActiveRecord::Base
  belongs_to :listing

  mount_uploader :listing_photo, ListingsPhotosUploader
end
