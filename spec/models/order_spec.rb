require 'spec_helper'
require 'factory_girl_rails'
describe Order do
	it "has a valid factory" do 
     FactoryGirl.create(:order).should be_valid
    end
end
