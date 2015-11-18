class BookingMailer < ApplicationMailer
  def host_booking_informing_email(customer, host)
      @host = host
      @customer = customer
      mail(to: "andygg1996personal@gmail.com", subject: "Hi, customer named,  " + @customer.first_name.capitalize + " " + @customer.last_name.capitalize + ", just book your room!")
  end

  def customer_booking_informing_email(customer, host)
    @host = host
    @customer = customer
    mail(to: @customer.email, subject: "Hi, you just booked a room from host named, "+@host.first_name.capitalize + " " + @host.last_name.capitalize)
  end
end
