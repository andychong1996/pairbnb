module ListingsSearchHelper
  def listing_available?(search_check_in_date, search_check_out_date, listing)
    (start_date - other.end_date) * (other.start_date - end_date) <= 0
  end
end
