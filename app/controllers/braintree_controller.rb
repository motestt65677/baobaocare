class BraintreeController < ApplicationController
  def new
  	 @client_token = Braintree::ClientToken.generate
     @type = params[:type]

    if @type == "one-month" 
      @amount = "100"
    elsif @type == "three-month"
      @amount = "300.00"
    elsif @type == "six-month"
      @amount = "500.00"    
    elsif @type == "one-year"
      @amount = "800.00"
    end
  end

  def checkout
    @type = params[:checkout_form][:type]
    if @type == "one-month" 
      @amount = "100"
    elsif @type == "three-month"
      @amount = "300.00"
    elsif @type == "six-month"
      @amount = "500.00"    
    elsif @type == "one-year"
      @amount = "800.00"
    end

  nonce_from_the_client = params[:checkout_form][:payment_method_nonce]

  result = Braintree::Transaction.sale(
   :amount => @amount, #this is currently hardcoded
   :payment_method_nonce => nonce_from_the_client,
   :options => {
      :submit_for_settlement => true
    }
   )
  
  if result.success?
    current_user[:subscription_status] = true
    current_user.save
    redirect_to :root, :flash => { :success => "Transaction successful!" }
  else  
  
    result.errors.for(:customer).each do |error|
      puts error.message
    end
  redirect_to :root, :flash => { :error => "Transaction failed. Please try again." }
  end
end 

end





