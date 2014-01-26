require 'spec_helper'
require 'factory_girl_rails'
describe User do
 it "has a valid factory" do 
 	FactoryGirl.create(:user).should be_valid
 end
end
