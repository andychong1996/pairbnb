class ListingsPhotosController <ApplicationController
  def new
    @current_listing = Listing.find(listing_params[:listing_id])
    @listings_photo = ListingsPhoto.new
  end

  def create
    
    if !listing_photo_params[:photos].nil?
      photos = listing_photo_params[:photos]
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
    @listings_photo = ListingsPhoto.new
  end

  def update
    
    if !listing_photo_params[:photos].nil?
      photos = listing_photo_params[:photos]
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
    params.require(:listings_photo).permit(:listing_id, photos: [])
  end

  def listing_params
    params.require(:listing_info).permit(:listing_id)
  end
end
