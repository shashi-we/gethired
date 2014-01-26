require 'spec_helper'

describe OrdersController do

  describe "GET 'uploadresume'" do
    it "upload resume" do
      @user = FactoryGirl.create(:user)
      session[:email] = @user.email
      template = FactoryGirl.create(:template)
      @order = FactoryGirl.create(:order,:user_id=>@user.id,:template_name=>template.name)
      session[:order_id] = @order.id
      get 'uploadresume' 
      response.should eq(200)
    end
  end
  describe "GET 'update'" do
    it "upload resume" do
      @user = FactoryGirl.create(:user)
      session[:email] = @user.email
      template = FactoryGirl.create(:template)
      @order = FactoryGirl.create(:order,:user_id=>@user.id,:template_name=>template.name,:document=>Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/original.docx'))))
      session[:order_id] = @order.id
      get 'update' 
      expect(assigns(:order)).to eq([@order])
    end
  end

end