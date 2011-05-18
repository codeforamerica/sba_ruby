require 'helper'

describe SBA::Client do
  before do
    @client = SBA::Client.new
  end  
  
  describe "#by_category" do
     it "should fetch licenses and permits by category" do
       category = @client.by_category
       category.first.title.should == "Register a Business Name"
     end
   end
end
