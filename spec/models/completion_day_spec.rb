require 'spec_helper'
require 'factory_girl_rails'
describe CompletionDay do
  it "has a valid factory" do 
    FactoryGirl.create(:completion_day).should be_valid
  end 
end
