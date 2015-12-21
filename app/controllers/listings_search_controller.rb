
class ListingsSearchController<ApplicationController

  def index
    @current_query = listings_search_params[:query]
    @current_check_in_date = listings_search_params[:check_in_date]
    @current_check_out_date = listings_search_params[:check_out_date]

    if @current_query.empty? && @current_check_in_date.empty? && @current_check_out_date.empty?
      @listings_search_result = Listing.all
    elsif @current_query.present? && @current_check_in_date.empty? && @current_check_out_date.empty?
      @listings_search_result = Listing.text_search(listings_search_params[:query])
    elsif @current_query.empty? && (@current_check_in_date.empty? || @current_check_out_date.empty?)
      @listings_search_result = Listing.all
      flash.now[:warning] = "Please insert both check-in and check-out dates to filter the listings!"
    elsif @current_query.present? && (@current_check_in_date.empty? || @current_check_out_date.empty?)
      @listings_search_result = Listing.text_search(listings_search_params[:query])
      flash.now[:warning] = "Please insert both check-in and check-out dates to filter the listings!"
    elsif @current_query.empty? && @current_check_in_date.present? && @current_check_out_date.present?
      @listings_search_result = Listing.find_by_sql ["SELECT * FROM LISTINGS WHERE ID NOT IN (SELECT listing_id FROM BOOKINGS WHERE (check_in_date-?)*(?-check_out_date)>=0)", Date.parse(@current_check_out_date), Date.parse(@current_check_in_date)]
    else
      @listings_search_result = Listing.available_listings(@current_query, @current_check_in_date, @current_check_out_date)
    end
  end

  def listings_search_params
    params.require(:listing_search_bar).permit(:query, :check_in_date, :check_out_date)
  end
end
