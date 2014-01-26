require 'spec_helper'
require 'factory_girl_rails'
describe Visitor do 
  it "has a valid factory" do 
    FactoryGirl.create(:visitor).should be_valid 
  end 
end