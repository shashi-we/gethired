class UsersController < ApplicationController
  before_filter :authenticate_user!
  def index
  end

  def show
  	@user = current_user
    @orders = @user.orders
  end

   def edit
    @user = current_user
  end

  def update_password
    @user = User.find(current_user.id)
    if @user.update(user_params)
      # Sign in the user by passing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to root_path
    else
      render "edit"
    end
  end

  private

  def user_params
    # NOTE: Using `strong_parameters` gem
    params.required(:user).permit(:password, :password_confirmation)
  end

end
