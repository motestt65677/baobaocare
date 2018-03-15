class BraintreeController < ApplicationController
  def new
  	 @client_token = Braintree::ClientToken.generate
     @type = params[:type]

    if @type == "monthly" 
      @amount = "300.00"

    elsif @type == "weekly"
      @amount = "200.00"

    elsif @type == "daily"
      @amount = "100.00"
   
    end
  end

  def checkout
    # @type = params[:type]


    # if @type == "monthly"
    #   @amount == "300.00"

    # elsif @type == "weekly"
    #   @amount == "200.00"

    # elsif @type == "daily"
    #   @amount == "100.00"

    # end

    if @amount = params[:checkout_form][:daily]
    elsif @amount = params[:checkout_form][:weekly]   
    elsif @amount = params[:checkout_form][:monthly]  
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
    redirect_to :root, :flash => { :success => "Transaction successful!" }
  else  
  
    result.errors.for(:customer).each do |error|
      puts error.message
    end
  redirect_to :root, :flash => { :error => "Transaction failed. Please try again." }
  end
end 

end





