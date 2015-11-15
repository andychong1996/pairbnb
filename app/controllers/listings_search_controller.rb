
class ListingsSearchController<ApplicationController

  def index
    @current_query = listings_search_params[:query]
    @listings_search_result = Listing.text_search(listings_search_params[:query])
  end

  def listings_search_params
    params.permit(:query)
  end
end
