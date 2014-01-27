class UsersController < ApplicationController
  before_filter :authenticate_user!
  def index
    redirect_to user_path(current_user)
  end

  def show
  	@user = current_user
    @orders = @user.orders
  end
end
