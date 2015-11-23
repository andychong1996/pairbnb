class BookingMailer < ApplicationMailer
  def host_booking_confirmation_email(listing, booking)
    @host = listing.user
    @current_listing = listing
    @customer = booking.user
    @current_booking = booking
    mail(to: @host.email, subject: "Customer named,  " + @customer.first_name.capitalize + " " + @customer.last_name.capitalize + ", just book your room!")
  end

  def customer_booking_confirmation_email(listing, booking)
    @host = listing.user
    @current_listing = listing
    @customer = booking.user
    @current_booking = booking
    mail(to: @customer.email, subject: "You just booked a room from host named, " + @host.first_name.capitalize + " " + @host.last_name.capitalize)
  end
end
