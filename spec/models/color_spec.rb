require 'spec_helper'
require 'factory_girl_rails'
describe Color do
	it "has a valid factory" do 
  		FactoryGirl.create(:color).should be_valid 
  	end
end
