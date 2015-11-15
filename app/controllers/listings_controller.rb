class ListingsController <ApplicationController

  def index
  end

  def new
    @current_listing = Listing.new
  end

  def create
    # create new llisting object
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
        flash[:new_listing_errors] = "Listing requirement doesn't meet!"
        redirect_to new_listing_path
      end
      # end inner if
    else
      # redirect to log in page and flash msgs
      flash[:no_acc_error] = "Please sign in to continue."
      redirect_to new_session_path
    end
    # end outer if
  end

  def listing_params
    # strong params
    params.require(:listing).permit(:title, :description, :price, :home_type, :room_type, :accommodates, :address, :city, :postal_code, :state, :country)
  end

  def show
    @current_listing = Listing.find(params[:id])
  end

end
