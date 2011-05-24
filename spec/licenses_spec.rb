require 'helper'

describe SBA do
  
  
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
  
  describe "#by_state" do
    before do
      stub_get("license_permit/all_by_state/ca.json").
        to_return(:status => 200, :body => fixture("by_state.json"))
    end
    
    it "should return business types required to operate in an specific state" do
      by_state = @client.by_state("CA")
      by_state.first.title.should == "Obtain Disability Insurance"
    end
  end
end