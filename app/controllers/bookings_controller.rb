class BookingsController < ActionController::Base

  def index

  end

  def create
    if booking_params[:customer_id].present?
      new_booking = Booking.new()
      new_booking.user_id = booking_params[:customer_id]
      new_booking.listing_id = booking_params[:listing_id]
      new_booking.check_in_date = Date.parse(booking_params[:check_in_date])
      new_booking.check_out_date = Date.parse(booking_params[:check_out_date])

      if new_booking.valid? && new_booking.save
        flash[:success] = "Congrat! Your Booking has successful been placed!"
        byebug
        BookingConfirmationEmailWorker.perform_in(5.seconds, new_booking.listing_id, new_booking.id)
        redirect_to listing_path(Listing.find(new_booking.listing_id))
      else
        flash[:error] = "Sorry, your booking is not valid! Please retry!"
        redirect_to listing_path(Listing.find(new_booking.listing_id))
      end
    else
      flash[:warning] = "Sorry, please login before booking."
      redirect_to new_session_path
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  def booking_params
    params.require(:booking).permit(:customer_id, :listing_id, :check_in_date, :check_out_date)
  end
end
