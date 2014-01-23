class TemplatesController < ApplicationController
  def index
  	@templates = Template.all.to_a
  end

  def show
    reset_session
    @template = Template.find(params[:id])
    @completion_day = @template.completion_days.order('price ASC')
    @pages = @template.number_of_pages.order('price ASC')
    @colors = @template.colors.order('price ASC')
  end

  def set_session
    session[:email],session[:t_id],session[:d_id],session[:p_id],session[:c_id] = nil,nil,nil,nil
    if !params[:completion_id].blank? && !params[:page_id].blank? && !params[:color_id].blank? && !params[:template_id].blank?
      session[:d_id] = params[:completion_id].gsub(/(\d+)\W/, '').to_i 
      session[:p_id] = params[:page_id].gsub(/(\d+)\W/, '').to_i 
      session[:c_id] = params[:color_id].gsub(/(\d+)\W/, '').to_i
      session[:t_id] = params[:template_id].to_i
      session[:email] = params[:email]
      set_price
      @template = Template.find(session[:t_id])
      email_exists = Visiter.find_by(:email_id => session[:email])
      if !email_exists.blank?
        email_exists.destroy
      end
      @visitor = Visiter.create!(:email_id => session[:email], :template_name => @template.name, :price => @template.price)
    end
  	respond_to do |format|
      format.js { render :text => 'ok' } 
    end
  end

  # def upload
  #   email = session[:email]
  #   password_length = 8
  #   password = Devise.friendly_token.first(password_length)
  #   if params[:user].present?
  #     @user = User.new(:email => email, :password => password, :password_confirmation => password,:document=>params[:user][:document])
  #   else
  #     @user = User.new(:email => email, :password => password, :password_confirmation => password)
  #   end
  #   if @user.save
  #     flash[:alert] = 'Thanks we will send you resume on your email adrress.'
  #     redirect_to templates_path
  #   else
  #     redirect_to charges_path
  #   end
  # end

  private 
    def set_price
      t_price = Template.find(session[:t_id]).price
      d_price = CompletionDay.find(session[:d_id]).price
      p_price = NumberOfPage.find(session[:p_id]).price
      c_price = Color.find(session[:c_id]).price
      session[:price] = t_price + d_price + p_price + c_price
    end

end
