class ListingsPhotosController <ApplicationController
  def new
    @current_listing = Listing.find(listing_params[:listing_id])

  end

  def create
    if !params[:listings_photos][:listing_photos].nil?
      photos = params[:listings_photos][:listing_photos]
      photos.each do |photo|
        new_photo = ListingsPhoto.new
        new_photo.listing_photo = photo
        new_photo.listing_id = listing_photo_params[:listing_id]
        new_photo.save
      end
    end
    redirect_to listing_path(Listing.find(listing_photo_params[:listing_id]))
  end

  def edit

  end

  def update
    if !params[:listings_photos][:listing_photos].nil?
      photos = params[:listings_photos][:listing_photos]
      photos.each do |photo|
        new_photo = ListingsPhoto.new
        new_photo.listing_photo = photo
        new_photo.listing_id = params[:id]
        new_photo.save
      end
    end

    redirect_to listing_path(Listing.find(listing_photo_params[:listing_id]))
  end

  def listing_photo_params
    params.require(:listings_photos).permit(:listing_id, :listing_photos)
  end

  def listing_params
    params.require(:listing_info).permit(:listing_id)
  end
end
