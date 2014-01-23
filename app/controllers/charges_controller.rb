class ChargesController < ApplicationController

	layout 'charges'
  
	def new
	end

	def create
	  # Amount in cents
	  @amount = (session[:price].to_i*100)

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
   	#  respond_to do |format|
   	#    format.js { render :res => 'ok' }
   	#  end

	  # #    flash[:alert] = e.message
	  create_user_order
		redirect_to uploadresume_orders_path
	end


	def bitcoin
		client = BitPay::Client.new bitcoin_access
		invoice = client.post 'invoice', {:price => session[:price].to_i , :currency => 'USD',:buyerEmail=>session[:email]}
		@url = invoice.find{|key,value| key["url"]}[1]
		create_user_order
	end

	private

	  def create_user_order
	  	# create user
	  	email = session[:email]
	    password_length = 8
	    password = Devise.friendly_token.first(password_length)
	    email_exists = User.find_by(:email => params[:email])
	    email_exists_visitor = Visiter.find_by(:email_id => params[:email])
	    if !email_exists_visitor.blank?
	    	email_exists_visitor.destroy
	    end
	    if !email_exists.blank?
	      @user = email_exists
	    else
	      @user = User.create!(:email => email, :password => password, :password_confirmation => password)
	    end
	    # create order 
	    template = Template.find(session[:t_id])
      completion_day  = CompletionDay.find(session[:d_id])
      page = NumberOfPage.find(session[:p_id])
      color = Color.find(session[:c_id])
      @order = @user.orders.create!(:template_name=>template.name,
		      	                :template_price=>template.price,
											      :complete_day =>completion_day.title,
											      :complete_day_price=>completion_day.price,
											      :number_of_page => page.title,
											      :page_price=>page.price,
											      :color=>color.title,
											      :color_price=>color.price,
											      :status=>'Processing',
											      :total_price=>session[:price])
      session[:order_id] = @order.id
      ApplicationHelper::EmailCampaignApi.add_email_mailchip(email,template.name,template.price,completion_day.title,completion_day.price,page.title,page.price,color.title,color.price,session[:price])
	  end


	  def bitcoin_access
	  	access_key = Setting.where(:account_type=>'bitcoin').first.access_key
	  	return access_key
	  end 
end
