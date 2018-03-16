class UserMailer < ApplicationMailer
	default from: "'notifications@example.com"

	def welcome_doctor_email(doctor)
		@doctor = doctor
		@url = 'www.google.com'
		mail to: @doctor.email, subject: "You are successfully registered!"
	end

	def welcome_mother_email(mother)
		@mother = mother
		@url = 'www.google.com'
		mail to: @mother.email, subject: "Wow, you made the right choice!"
	end

end