require 'helper'

describe SBA do
  
  describe "#by_category" do
   before do
      stub_request(:get, 'http://api.sba.gov/license_permit/by_category/doing%20business%20as.json').
        with().
        to_return(:body => fixture('doing_business_as.json'),
                  :headers => {'Content-Type' => 'application/json'})
    end
    it "should request the correct resource" do
      SBA.by_category('doing business as')
      a_request(:get, 'http://api.sba.gov/license_permit/by_category/doing%20business%20as.json').
        with().
        should have_been_made
    end
    it "should return the correct results" do
      test = SBA.by_category('doing business as')
      test.should be_a Hash
      test.first.url.should == "http://www.sec.state.vt.us/tutor/dobiz/dobizdoc.htm"
    end
  end
  
 
  describe "#by_state" do
    before do
        stub_request(:get, 'http://api.sba.gov/license_permit/all_by_state/ca.json').
          with().
          to_return(:body => fixture('by_state.json'),
                    :headers => {'Content-Type' => 'application/json'})
      end
      it "should request the correct resource" do
        SBA.by_state("CA")
        a_request(:get, 'http://api.sba.gov/license_permit/all_by_state/ca.json').
          with().
          should have_been_made
      end
      it "should return the correct results" do
        test = SBA.by_state("CA")
        test.should be_a Hash
        by_state.first.title.should == "Obtain Disability Insurance"
      end
    end    
end