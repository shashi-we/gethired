class OrdersController < ApplicationController
  before_filter :check_user_session
  

  def uploadresume
   @order = Order.find(session[:order_id])
  end

  def update
  	@order = Order.find(session[:order_id])
  	if @order.update_attributes(:document=>params[:order][:document])
  		flash[:notice] = 'We will send your password on given email address you can check your resume status.'
      redirect_to new_user_session_path
  	else
  		render 'uploadresume'
  	end
  end

  


	private
	
  def check_user_session
  	if session[:email].blank? && session[:order_id].blank?
      redirect_to templates_path
  	end
  end
end
