class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery 

  before_filter :load_tweets
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) { |u| 
      u.permit(:password, :password_confirmation, :current_password) 
    }
  end

  def load_tweets
  	@client = Twitter::REST::Client.new do |config|
  	# development
	  # config.consumer_key = 'CuSqe0arU66efPxnN253cA'
	  # config.consumer_secret = 'ZrkFgW1aMHfm0gqBxF33ySf6SSAQurwwDwXqLeXUmvk'
	  # config.access_token = '2291256133-VgHVTiC6pQHBVOoeY3Cgtoz98Qj9pGDYklD8AOA'
	  # config.access_token_secret = 'i51w0Jfztkg8ObuoBHHbR6goOePfEIUuTT3P1HZIHqAr1'
	  # staging
	  config.consumer_key = '4AS9ZwR0Dacf6ArJKLsQ'
	  config.consumer_secret = 'KnjW3Ltrhw4UQXZ7hmHDBDl4QOxFZnLlfeV9KbQ3fo'
	  config.access_token = '2291256133-BLTkKSWlXJUEqY5Wy0Degh5cIOblvRdCFOvO4ES'
	  config.access_token_secret = '0mk3FDRHENwj2wM7fBfNW8zIlZzow3z2XYGVyqPMBHB8p'
	  end
	  @tweets = @client.user_timeline[0..4] # For this demonstration lets keep the tweets limited to the first 5 available.
  end
end
