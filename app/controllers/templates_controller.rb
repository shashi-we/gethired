class TemplatesController < ApplicationController
  def index
  	@template = Template.all.to_a
  end
end
