
class ListingsSearchController<ApplicationController

  def index
    @current_query = listings_search_params[:query]
    @listings_search_result = Listing.text_search(listings_search_params[:query])
  end

  def listings_search_params
    params.require(:listing_search_bar).permit(:query, :check_in_date, :check_out_date)
  end
end
