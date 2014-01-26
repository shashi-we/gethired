require 'spec_helper'
require 'factory_girl_rails'
describe NumberOfPage do
	it "has a valid factory" do 
  		FactoryGirl.create(:number_of_page).should be_valid 
  	end
end
