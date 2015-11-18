# Preview all emails at http://localhost:3000/rails/mailers/booking_mailer
class BookingMailerPreview < ActionMailer::Preview
  def host_booking_informing_email_preview
    BookingMailer.host_booking_informing_email(User.first, User.last)
  end

  def customer_booking_informing_email_preview
    BookingMailer.customer_booking_informing_email(User.first, User.last)
  end
end
