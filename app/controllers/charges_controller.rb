class ChargesController < ApplicationController
    force_ssl 
	layout 'charges'
  
	def new
		render layout: false
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
		client = BitPay::Client.new BITPAY_KEY
		invoice = client.post 'invoice', {:price => 1, :currency => 'USD',:buyerEmail=>session[:email],:redirectURL=>'http://gethired.herokuapp.com/orders/uploadresume'}
		@url = invoice.find{|key,value| key["url"]}[1]
		create_user_order
		render layout: false
	end

	private

	  def create_user_order
	  	# create user
	  	email = session[:email]
	    password = ApplicationHelper::MethodHelper.generate
	    @user = User.create_user(email,password)
	    # check visitor if exist than delete recored
	    Visitor.check_visitore_email(email)
	    
	    template = Template.find(session[:t_id])
      completion_day  = CompletionDay.find(session[:d_id])
      page = NumberOfPage.find(session[:p_id])
      color = Color.find(session[:c_id])
      if session[:digital_download]
      	@order = @user.orders.create!(:template_name=>template.name,:template_price=>template.price)
      	ApplicationHelper::MethodHelper.add_email_mailchip_digital(email,password,template.name,template.digital_price)
        session[:order_id] = @order.id
      else
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
	      ApplicationHelper::MethodHelper.add_email_mailchip(email,template.name,template.price,completion_day.title,completion_day.price,page.title,page.price,color.title,color.price,session[:price],password)
	    end
	  end
end
