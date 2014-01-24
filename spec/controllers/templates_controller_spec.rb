require 'spec_helper'

describe TemplatesController do
  # before(:each) do
  #   @template = FactoryGirl.create(:template)
  # end

  describe "GET 'index'" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
end
