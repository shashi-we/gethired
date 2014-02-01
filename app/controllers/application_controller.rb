class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery 

  before_filter :load_tweets
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :check_for_correct_subdomains


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
	  config.consumer_key = 'L60LTWBBivxpDhWzFvQO7A'
	  config.consumer_secret = 'TAJg72HXrIgdsuUFVCfpdF67nEprF6jP92Gbbv0jzdo'
	  config.access_token = '2291256133-BLTkKSWlXJUEqY5Wy0Degh5cIOblvRdCFOvO4ES'
	  config.access_token_secret = '0mk3FDRHENwj2wM7fBfNW8zIlZzow3z2XYGVyqPMBHB8p'
	  end
	  @tweets = @client.user_timeline[0..4] # For this demonstration lets keep the tweets limited to the first 5 available.
  end

  def check_for_correct_subdomains
    requested_host = request.host_with_port
    secure_host = 'gethired-io.herokuapp.com'
    controller = params['controller']
    action = params['action']
    # raise "#{controller} #{action}".inspect
    secure_paths = [
      {controller: 'charges', action: ['new', 'create', 'bitcoin']}]
    is_secure_path = secure_paths.find do |path|
      path[:controller] == (controller) and path[:action].include?(action)
    end
    if is_secure_path and requested_host != secure_host
      redirect_to params.merge({host: secure_host}), protocol: 'https'
    elsif !is_secure_path and requested_host == secure_host
      redirect_to params.merge({host: secure_host, protocol: 'http'})
    end
  end
end
