class ChargesController < ApplicationController

	layout 'charges'

  def index
  	@user = User.new
  	respond_to do |format|
      format.html {render :layout => 'application'}
    end
  end

	def new
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

	# rescue Stripe::CardError => e
  #    flash[:alert] = e.message
		redirect_to charges_path
    # respond_to do |format|
    # # format.html
    # # format.xml { render :xml => @users }
    #   format.js { render :res => e.message }
    # end
	end


	def bitcoin
		client = BitPay::Client.new bitcoin_access
		invoice = client.post 'invoice', {:price => set_price, :currency => 'USD',:buyerEmail=>session[:email],:redirectURL=>'http://127.0.0.1/charges'}
		@url = invoice.find{|key,value| key["url"]}[1]
	end

	private
	  def set_price
	  	amount = session[:template_price]+session[:completion_price]+session[:page_price]+session[:color_price]
      return amount
	  end

	  def bitcoin_access
	  	access_key = Setting.where(:account_type=>'bitcoin').first.access_key
	  	return access_key
	  end 
end
