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
  	respond_to do |format|
      format.js { render :text => 'ok' }
    end
  end

end
