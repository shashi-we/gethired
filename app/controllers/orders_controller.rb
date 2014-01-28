class OrdersController < ApplicationController
  before_filter :check_user_session 
  

  def uploadresume
    if session[:order_id].present?
      @order = Order.find(session[:order_id])
    else
      @order = Order.find(params[:order_id].to_i)
    end
  end

  def update
  	@order = Order.find(params[:id])
  	if @order.update_attributes(:document=>params[:order][:document])
      flash[:notice] = 'Your resume successfully uploded.'
      redirect_condition
  	else
  		render 'uploadresume'
  	end
  end

  


	private
	
  def check_user_session 
    unless current_user.present?
      if (session[:email].blank? && session[:order_id].blank?)
        redirect_to templates_path
    	end
    end
  end

  def redirect_condition
    if current_user
      redirect_to user_path(current_user)
    else
      redirect_to new_user_session_path
    end
  end
end
