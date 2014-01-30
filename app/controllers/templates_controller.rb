class TemplatesController < ApplicationController
  def index
    if params[:tag]
      @templates = Template.tagged_with(params[:tag])
    elsif params[:type] == 'bs'
      @templates = Template.last(6).reverse
    else
      @templates = Template.all.to_a
    end
  end

  def show
    resetsession
    @template = Template.find(params[:id])
    @completion_day = @template.completion_days.order('price ASC')
    @pages = @template.number_of_pages.order('price ASC')
    @colors = @template.colors.order('price ASC')
  end

  def set_session
    resetsession
    if !params[:completion_id].blank? && !params[:page_id].blank? && !params[:color_id].blank? && !params[:template_id].blank?
      session[:d_id] = params[:completion_id].gsub(/(\d+)\W/, '').to_i 
      session[:p_id] = params[:page_id].gsub(/(\d+)\W/, '').to_i 
      session[:c_id] = params[:color_id].gsub(/(\d+)\W/, '').to_i
      session[:t_id] = params[:template_id].to_i
      session[:email] = params[:email]
      if params[:dg_value] == "true"
        @template = Template.find(session[:t_id])
        session[:price] = @template.digital_price
        session[:digital_download] = 'Digital Download'
      else
        set_price
      end
      @template = Template.find(session[:t_id])
      email_exists = Visitor.find_by(:email_id => session[:email])
      if !email_exists.blank?
        email_exists.destroy
      end
      @visitor = Visitor.create!(:email_id => session[:email], :template_name => @template.name, :price => @template.price)
    end
  	respond_to do |format|
      format.js { render :text => 'ok' } 
    end
  end

  private 
    def set_price
      @template = Template.find(session[:t_id])
      d_price = CompletionDay.find(session[:d_id]).price
      p_price = NumberOfPage.find(session[:p_id]).price
      c_price = Color.find(session[:c_id]).price
      @price = @template.price + d_price + p_price + c_price
      
      if !@template.offer_discount.blank?
        session[:price] = (@price - @template.offer_discount)
      else
        session[:price] = @price
      end
    end

    def resetsession
      session[:email],session[:t_id],session[:d_id],session[:p_id],session[:c_id],session[:digital_download], session[:price]  = nil,nil,nil,nil,nil,nil
    end

end
