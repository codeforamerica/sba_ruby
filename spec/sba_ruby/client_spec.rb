require 'helper'

describe SBA::Client do
  before do
    @client = SBA::Client.new
  end  
  
  describe "#by_category" do
    before do
      stub_get("license_permit/by_category/doing%20business%20as.json").
        to_return(:status => 200, :body => fixture("doing_business_as.json"))
    end
    
    it "should fetch licenses and permits by category" do
      category = @client.by_category("doing business as")
      category.first.title.should == "Register a Business Name"
    end
  end
end
