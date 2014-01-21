class TemplatesController < ApplicationController
  def index
  	@templates = Template.all.to_a
  end

  def show
    session[:email],session[:template_price],session[:completion_price],session[:page_price],session[:color_price] = nil,nil,nil,nil,nil
    @template = Template.find(params[:id])
    @completion_day = @template.completion_days.order('price ASC')
    @pages = @template.number_of_pages.order('price ASC')
    @colors = @template.colors.order('price ASC')
  end

  def set_session
    if !params[:completion_id].blank? && !params[:page_id].blank? && !params[:color_id].blank? && !params[:template_id].blank?
      d_id = params[:completion_id].gsub(/(\d+)\W/, '').to_i 
      p_id = params[:page_id].gsub(/(\d+)\W/, '').to_i 
      c_id = params[:color_id].gsub(/(\d+)\W/, '').to_i
      t_id = params[:template_id].to_i
      set_session_varible(d_id,p_id,c_id,t_id,params[:email])
    end
  	respond_to do |format|
      format.js { render :text => 'ok' }
    end
  end

  def upload
    email = session[:email]
    password_length = 8
    password = Devise.friendly_token.first(password_length)
    @user = User.new(:email => email, :password => password, :password_confirmation => password,:document=>params[:user][:document])
    if @user.save
      flash[:alert] = 'Thanks we will send you resume on your email adrress.'
      redirect_to templates_path
    else
      flash[:alert] = @user.errors.messages
      redirect_to charges_path
    end
  end

  private 
    def set_session_varible(day_id,page_id,color_id,tem_id,email)
      session[:email],session[:template_price],session[:completion_price],session[:page_price],session[:color_price] = nil,nil,nil,nil,nil
      session[:template_price] = Template.find(tem_id).price
      session[:completion_price]  = CompletionDay.find(day_id).price
      session[:page_price] = NumberOfPage.find(page_id).price
      session[:color_price] = Color.find(color_id).price
      session[:email] = email
    end

end
