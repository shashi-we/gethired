class TemplatesController < ApplicationController
  def index
  	@templates = Template.all.to_a
  end

  def show
    @template = Template.find(params[:id])
    @completion_day = @template.completion_days.order('price ASC')
    @pages = @template.number_of_pages.order('price ASC')
    @colors = @template.colors.order('price ASC')
  end

  def set_session
    session[:email] = nil
    session[:email] = params[:email]
    d_id = params[:completion_id].gsub(/(\d+)\W/, '').to_i 
    p_id = params[:page_id].gsub(/(\d+)\W/, '').to_i 
    c_id = params[:color_id].gsub(/(\d+)\W/, '').to_i
    t_id = params[:template_id].to_i
    @template = Template.find(t_id) 
  	respond_to do |format|
      format.js { render :text => 'ok' }
    end
  end

end
