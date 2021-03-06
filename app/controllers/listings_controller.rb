class ListingsController <ApplicationController

  def index
    @listings = current_user.listings
  end

  def new
    @current_listing = Listing.new
  end

  def create
    # create new listing object
    @current_listing = Listing.new(listing_params)
    # if there're a current user
    if current_user
      # set current listing object's user id to current user id
      @current_listing.user_id = current_user.id
      # if currrent listing is valid and saved,
      if @current_listing.valid? && @current_listing.save
        #  redirect to home
        redirect_to @current_listing
      else
        # redirect to new listing path and flash msgs
        flash[:error] = "Listing requirement doesn't meet!"
        redirect_to new_listing_path
      end
      # end inner if
    else
      # redirect to log in page and flash msgs
      flash[:warning] = "Please sign in first to list your space!"
      redirect_to new_session_path
    end
    # end outer if
  end

  def show
    @new_booking = Booking.new
    @current_listing = Listing.find(params[:id])
    @blocked_dates = get_blocked_dates(@current_listing)
  end

  def edit
    @current_listing = Listing.find(params[:id])
  end

  def update

   if @current_listing.update_attributes(listing_params)
     render 'show'
   else
     render 'edit'
   end
  end

  def listing_params
    # strong params
    params.require(:listing).permit(:photos, :title, :description, :price, :home_type, :room_type, :accommodates, :address, :city, :postal_code, :state, :country)
  end



end
