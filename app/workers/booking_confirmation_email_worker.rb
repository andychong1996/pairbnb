class BookingConfirmationEmailWorker
  include Sidekiq::Worker

  def perform(listing_id, booking_id)

    current_listing = Listing.find(listing_id)
    current_booking = Booking.find(booking_id)
    BookingMailer.customer_booking_confirmation_email(current_listing, current_booking).deliver_now
  end
end
