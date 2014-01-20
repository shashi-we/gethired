class ChargesController < ApplicationController

	layout 'charges'

  def index

  end

	def new
	end

	def create
	  # Amount in cents
	  @amount = 500

	  customer = Stripe::Customer.create(
	    :email => 'example@stripe.com',
	    :card  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @amount,
	    :description => 'Rails Stripe customer',
	    :currency    => 'usd'
	  )

		#rescue Stripe::CardError => e
    #flash[:alert] = e.message
		redirect_to charges_path
      # respond_to do |format|
      # # format.html
      # # format.xml { render :xml => @users }
      #   format.js { render :res => e.message }
      # end
	end


	def bitcoin
		client = BitPay::Client.new 'Liq5X9eLZP17xr9uBjNnex7w4MfEPeF2ESuoTmJjrw'
		invoice = client.post 'invoice', {:price => 10.00, :currency => 'USD',:buyerEmail=>"example@gmail.com"}
		@url = invoice.find{|key,value| key["url"]}[1]
	end
end
