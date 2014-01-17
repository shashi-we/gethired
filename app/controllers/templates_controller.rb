class TemplatesController < ApplicationController
  def index
  	@templates = Template.all.to_a
  end

  def show
    @template = Template.find(params[:id])
    @completion_day = @template.completion_days
    @pages = @template.number_of_pages
    @colors = @template.colors
  end

end
