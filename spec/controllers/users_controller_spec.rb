require 'spec_helper'

describe UsersController do
   before(:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end
  describe "GET 'index'" do
    it "returns to show action" do
      get 'index'
      response.should redirect_to @user
    end
  end
  describe "GET 'show'" do
    it "display user order" do
      template = FactoryGirl.create(:template)
      completion_day = FactoryGirl.create(:completion_day,:template=>template)
      number_of_page = FactoryGirl.create(:number_of_page,:template=>template)
      color = FactoryGirl.create(:color,:template=>template)
      order = FactoryGirl.create(:order,:user_id=>@user.id,:template_name=>template.name)
      @user.orders
      get :show,:id =>@user.id
      assigns(:user).should eq(@user)
    end
  end
  
end
