class WelcomeController < ApplicationController
	def index
	end

	def blog
		redirect_to("/blog/")
	end
end
