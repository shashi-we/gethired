class WelcomeController < ApplicationController
	require 'rss'
	def index
		#@rss = RSS::Parser.parse(open('http://gethired.herokuapp.com/blog/?feed=rss2').read, false).items[0..1]
	  @best_template = Template.last
	  @resume_template = Template.first
	end

	def blog
		redirect_to("/blog/")
	end

	def contact
	end

	
end
