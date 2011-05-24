require 'helper'

describe SBA do
  describe "loan_grants_by_federal" do
    before do
      stub_request(:get, 'http://api.sba.gov/loans_grants/federal.json').
        with().
        to_return(:body => fixture('loan_grants.json'),
                  :headers => {'Content-Type' => 'application/json'})
    end
    it "should request the correct resource" do
      SBA.loan_grants_by_federal()
      a_request(:get, 'http://api.sba.gov/loans_grants/federal.json').
        with().
        should have_been_made
    end
    it "should return the correct results" do
      test = SBA.loan_grants_by_federal()
      test.should be_an Array
      test[0]["title"].should == "Emergency Farm Loans"
      test[1]["title"].should == "Economic Injury Loans"
    end
  end
end

