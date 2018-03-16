class ReservationMailer < ApplicationMailer
	default from: "'notifications@example.com"

  def reservation_mailer(mother, doctor)
  	@mother = mother
  	@doctor = doctor 
  	@url = "www.google.com"
		mail to: @mother.email, subject: :"Your chatroom is now booked."
	end
end