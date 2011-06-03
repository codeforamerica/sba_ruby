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
  
  describe "loan_grants_by_state" do
    before do
      stub_request(:get, 'http://api.sba.gov/loans_grants/state_financing_for/ca.json').
        with().
        to_return(:body => fixture('state_financing_for.json'),
                  :headers => {'Content-Type' => 'application/json'})
    end
    it "should request the correct resource" do
      SBA.loan_grants_by_state("ca")
      a_request(:get, 'http://api.sba.gov/loans_grants/state_financing_for/ca.json').
        with().
        should have_been_made
    end
    it "should return the correct results" do
      test = SBA.loan_grants_by_state("ca")
      test.should be_an Array
      test[0]["title"].should == "Small Business Loan Guarantee Program"
    end
  end

  describe "loan_grants_by_federal_state" do
    before do
      stub_request(:get, 'http://api.sba.gov/loans_grants/federal_and_state_financing_for/ca.json').
        with().
        to_return(:body => fixture('federal_and_state_financing_for.json'),
                  :headers => {'Content-Type' => 'application/json'})
    end
    it "should request the correct resource" do
      SBA.loan_grants_by_federal_state("ca")
      a_request(:get, 'http://api.sba.gov/loans_grants/federal_and_state_financing_for/ca.json').
        with().
        should have_been_made
    end
    it "should return the correct results" do
      test = SBA.loan_grants_by_federal_state("ca")
      test.should be_an Array
      test[0]["title"].should == "Emergency Farm Loans"
      test[1]["title"].should == "Economic Injury Loans"
    end
  end

  describe "loan_grants_by_industry" do
    before do
      stub_request(:get, 'http://api.sba.gov/loans_grants/nil/for_profit/manufacturing/nil.json').
        with().
        to_return(:body => fixture('loan_grants_industry.json'),
                  :headers => {'Content-Type' => 'application/json'})
    end
    it "should request the correct resource" do
      SBA.loan_grants_by_industry("manufacturing")
      a_request(:get, 'http://api.sba.gov/loans_grants/nil/for_profit/manufacturing/nil.json').
        with().
        should have_been_made
    end
    it "should return the correct results" do
      test = SBA.loan_grants_by_industry("manufacturing")
      test.should be_an Array
      test[0]["title"].should == "Small Manufacturers Competitiveness Fund (SMCF)"
      test[1]["title"].should == "Manufacturing Modernization Loan Program "
    end
  end  
  
  describe "loan_grants_by_specialty" do
    before do
      stub_request(:get, 'http://api.sba.gov/loans_grants/nil/for_profit/nil/woman.json').
        with().
        to_return(:body => fixture('loan_grants_by_specialty.json'),
                  :headers => {'Content-Type' => 'application/json'})
    end
    it "should request the correct resource" do
      SBA.loan_grants_by_specialty("woman")
      a_request(:get, 'http://api.sba.gov/loans_grants/nil/for_profit/nil/woman.json').
        with().
        should have_been_made
    end
    it "should return the correct results" do
      test = SBA.loan_grants_by_specialty("woman")
      test.should be_an Array
      test[0]["title"].should == "Minority, Women, and Disabled Participation Loan Program"
      test[1]["title"].should == "Community Loans for Women, Minority-Owned and Non Profit Businesses"
    end
  end

  describe "loan_grants_by_industry_specialty" do
    before do
      stub_request(:get, 'http://api.sba.gov/loans_grants/nil/for_profit/manufacturing/woman.json').
        with().
        to_return(:body => fixture('loan_grants_by_industry_specialty.json'),
                  :headers => {'Content-Type' => 'application/json'})
    end
    it "should request the correct resource" do
      SBA.loan_grants_by_industy_specialty("manufacturing","woman")
      a_request(:get, 'http://api.sba.gov/loans_grants/nil/for_profit/manufacturing/woman.json').
        with().
        should have_been_made
    end
    it "should return the correct results" do
      test = SBA.loan_grants_by_industy_specialty("manufacturing","woman")
      test.should be_an Array
      test[0]["title"].should == "Minority, Women, and Disabled Participation Loan Program"
      test[1]["title"].should == "Target Small Business Assistance Program"
    end
  end
  
end

