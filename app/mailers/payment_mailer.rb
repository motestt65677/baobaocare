class PaymentMailer < ApplicationMailer
	default from: "'notifications@example.com"

	def customer_email(mother,amount)
		@amount = amount
		@mother = mother 
		@url = "www.google.com"
		mail to: @mother.email, subject: :"You are now subscribed to BaoBaoCare!"
	end

end