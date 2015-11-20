module BookingsHelper

  def get_blocked_dates(listing)
    blocked_dates = []
    listing.bookings.all.each do |booking|
      blocked_dates += (booking.check_in_date...booking.check_out_date).map(&:to_s)
    end
    blocked_dates
  end

end
