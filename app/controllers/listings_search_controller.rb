
class ListingsSearchController<ApplicationController

  def index
    @current_query = listings_search_params[:query]
    @current_check_in_date = listings_search_params[:check_in_date]
    @current_check_out_date = listings_search_params[:check_out_date]

    if @current_query.empty? && @current_check_in_date.empty? && @current_check_out_date.empty?
      @listings_search_result = Listing.all
    elsif !@current_query.empty? && @current_check_in_date.empty? && @current_check_out_date.empty?
      @listings_search_result = Listing.text_search(listings_search_params[:query])
    elsif !@current_query.empty? && (@current_check_in_date.empty? || @current_check_out_date.empty?)
      @listings_search_result = Listing.text_search(listings_search_params[:query])
      flash.now[:date_empty_error] = "Please insert both check-in and check-out dates to query with it!"
    else

      @listings_search_result = Listing.available_listings(@current_query, @current_check_in_date, @current_check_out_date)
    end
  end

  def listings_search_params
    params.require(:listing_search_bar).permit(:query, :check_in_date, :check_out_date)
  end
end
