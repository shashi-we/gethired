require 'spec_helper'

describe TemplatesController do
  describe "GET 'index'" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
     it "assigns @template" do
      @template = FactoryGirl.create(:template)
      get :index
      expect(assigns(:templates)).to eq([@template])
    end
  end
  describe "GET 'show'" do
     it "assigns @template" do
      template = FactoryGirl.create(:template)
      completion_day = FactoryGirl.create(:completion_day,:template=>template)
      number_of_page = FactoryGirl.create(:number_of_page,:template=>template)
      color = FactoryGirl.create(:color,:template=>template)
      template.completion_days
      template.number_of_pages
      template.colors
      get :show,:id =>template.id
      assigns(:template).should eq(template)
    end
  end

  describe "GET 'set_session'" do 
    it 'should be set session varible'  do
      template = FactoryGirl.create(:template)
      completion_day = FactoryGirl.create(:completion_day,:template=>template)
      number_of_page = FactoryGirl.create(:number_of_page,:template=>template)
      color = FactoryGirl.create(:color,:template=>template) 
      session[:email] = 'example@gmail.com'
      session[:t_id] = template.id
      session[:d_id] = completion_day.id
      session[:p_id] = number_of_page.id
      session[:c_id] = number_of_page.id
      @template = Template.find(session[:t_id])
      visitor = FactoryGirl.create(:visitor,:email_id => session[:email], :template_name => @template.name, :price => @template.price)
      get :set_session, :format => 'js'
    end
  end
end
