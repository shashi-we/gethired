class ChargesController < ApplicationController

	layout 'charges'

  def index

  end

	def new
		debugger
	end

	def create
	  # Amount in cents
	  @amount = (set_price*100)

	  customer = Stripe::Customer.create(
	    :email => session[:email],
	    :card  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @amount,
	    :description => 'Stripe customer',
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
		invoice = client.post 'invoice', {:price => set_price, :currency => 'USD',:buyerEmail=>session[:email]}
		debugger
		@url = invoice.find{|key,value| key["url"]}[1]
	end

	private
	  def set_price
	  	amount = session[:template_price]+session[:completion_price]+session[:page_price]+session[:color_price]
      return amount
	  end

	  

end
