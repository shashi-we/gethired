require 'spec_helper'
require 'factory_girl_rails'
describe Template do
	it "has a valid factory" do 
  		FactoryGirl.create(:template).should be_valid
  	end
end
