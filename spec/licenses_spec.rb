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
      test["category_site"][1]["url"].should == "http://www.dced.state.ak.us/bsc/register.html"
    end
  end

  describe "#by_state" do
    before do
    @path = "http://api.sba.gov/license_permit/all_by_state/CA.json?format=json"
      stub_request(:get, @path).
      with().
      to_return(:body => fixture('by_state.json'),
                :headers => {'Content-Type' => 'application/json'})
    end
    it "should request the correct resource" do
      SBA.by_state("CA")
      a_request(:get, @path).
        with().
        should have_been_made
    end
    it "should return the correct results" do
      test = SBA.by_state("CA")
      test.should be_a Hash
      test["state_site"][0]["title"].should == "Obtain Disability Insurance"
    end
  end

  describe "#by_business_type" do
     before do
       stub_request(:get, 'http://api.sba.gov/license_permit/by_business_type/child%20care%20services.json').
         with().
         to_return(:body => fixture('by_business_type.json'),
                   :headers => {'Content-Type' => 'application/json'})
     end
     it "should request the correct resource" do
       SBA.by_business_type("child care services")
       a_request(:get, 'http://api.sba.gov/license_permit/by_business_type/child%20care%20services.json').
         with().
         should have_been_made
     end
     it "should return the correct results" do
       test = SBA.by_business_type("child care services")
       test.should be_an Hash
       test["business_type_site"][0]["url"].should == "http://www.hss.state.ak.us/dpa/programs/ccare/become_a_provider.htm"
       test["business_type_site"][1]["url"].should == "http://www.azdhs.gov/als/childcare/"
     end
   end
   
   describe "#business_type_state" do
      before do
        stub_request(:get, 'http://api.sba.gov/license_permit/state_only/child%20care%20services/va.json').
          with().
          to_return(:body => fixture('business_type_state.json'),
                    :headers => {'Content-Type' => 'application/json'})
      end
      it "should request the correct resource" do
        SBA.business_type_state("child care services", "va")
        a_request(:get, 'http://api.sba.gov/license_permit/state_only/child%20care%20services/va.json').
          with().
          should have_been_made
      end
      it "should return the correct results" do
        test = SBA.business_type_state("child care services", "va")
        test.should be_an Hash
        test["state_site"][0]["url"].should == "http://www.vec.virginia.gov/vecportal/unins/insunemp.cfm"
      end
    end
    
    describe "#business_type_state_county" do
       before do
         stub_request(:get, 'http://api.sba.gov/license_permit/state_and_county/child%20care%20services/ca/los%20angeles%20county.json').
           with().
           to_return(:body => fixture('business_type_state_county.json'),
                     :headers => {'Content-Type' => 'application/json'})
       end
       it "should request the correct resource" do
         SBA.business_type_state_county("child care services", "ca", "los angeles county")
         a_request(:get, 'http://api.sba.gov/license_permit/state_and_county/child%20care%20services/ca/los%20angeles%20county.json').
           with().
           should have_been_made
       end
       it "should return the correct results" do
         test = SBA.business_type_state_county("child care services", "ca", "los angeles county")
         test.should be_an Hash
         test["state_site"][0]["url"].should == "http://www.edd.ca.gov/Disability/"
       end
     end
     
     describe "#business_type_state_city" do
        before do
          stub_request(:get, 'http://api.sba.gov/license_permit/state_and_city/restaurant/ny/albany.json').
            with().
            to_return(:body => fixture('business_type_state_city.json'),
                      :headers => {'Content-Type' => 'application/json'})
        end
        it "should request the correct resource" do
          SBA.business_type_state_city("restaurant", "ny", "albany")
          a_request(:get, 'http://api.sba.gov/license_permit/state_and_city/restaurant/ny/albany.json').
            with().
            should have_been_made
        end
        it "should return the correct results" do
          test = SBA.business_type_state_city("restaurant", "ny", "albany")
          test.should be_an Hash
          test["state_site"][0]["url"].should == "http://www.wcb.state.ny.us/content/main/DisabilityBenefits/Employer/introToLaw.jsp"
          test["state_site"][1]["url"].should == "http://www.labor.state.ny.us/ui/dande/register1.shtm"
        end
    end
    
    describe "#business_type_zip" do
        before do
          stub_request(:get, 'http://api.sba.gov/license_permit/by_zip/restaurant/49684.json').
            with().
            to_return(:body => fixture('business_type_zip.json'),
                      :headers => {'Content-Type' => 'application/json'})
        end
        it "should request the correct resource" do
          SBA.business_type_zip("49684")
          a_request(:get, 'http://api.sba.gov/license_permit/by_zip/restaurant/49684.json').
            with().
            should have_been_made
        end
        it "should return the correct results" do
          test = SBA.business_type_zip("49684")
          test.should be_an Hash
          test["state_site"][0]["url"].should == "http://www.michigan.gov/uia/0,1607,7-118-26898---,00.html"
          test["state_site"][1]["url"].should == "http://www.michigan.gov/wca/0,1607,7-191-26925---,00.html"
        end
    end
end
