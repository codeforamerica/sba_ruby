require 'helper'

describe SBA do
  describe ".data_city_county" do
    before do
      stub_request(:get, 'http://api.sba.gov/geodata/city_county_data_for_state_of/ca.json').
        with().
        to_return(:body => fixture('data_city_county.json'),
                  :headers => {'Content-Type' => 'application/json'})
    end
    it "should request the correct resource" do
      SBA.data_city_county('ca')
      a_request(:get, 'http://api.sba.gov/geodata/city_county_data_for_state_of/ca.json').
        with().
        should have_been_made
    end
    it "should return the correct results" do
      test = SBA.data_city_county('ca')
      test.should be_an Array
      test[0]["url"].should == "http://www.ci.adelanto.ca.us/"
      test[1]["url"].should == "http://ci.agoura-hills.ca.us/"
    end
  end
  describe ".data_city" do
    before do
      stub_request(:get, 'http://api.sba.gov/geodata/city_data_for_state_of/ca.json').
        with().
        to_return(:body => fixture('data_city.json'),
                  :headers => {'Content-Type' => 'application/json'})
    end
    it "should request the correct resource" do
      SBA.data_city('ca')
      a_request(:get, 'http://api.sba.gov/geodata/city_data_for_state_of/ca.json').
        with().
        should have_been_made
    end
    it "should return the correct results" do
      test = SBA.data_city('ca')
      test.should be_an Array
      test[0]["url"].should == "http://www.ci.adelanto.ca.us/"
      test[1]["url"].should == "http://ci.agoura-hills.ca.us/"
    end
  end
  describe ".data_county" do
    before do
      stub_request(:get, 'http://api.sba.gov/geodata/county_data_for_state_of/ca.json').
        with().
        to_return(:body => fixture('data_county.json'),
                  :headers => {'Content-Type' => 'application/json'})
    end
    it "should request the correct resource" do
      SBA.data_county('ca')
      a_request(:get, 'http://api.sba.gov/geodata/county_data_for_state_of/ca.json').
        with().
        should have_been_made
    end
    it "should return the correct results" do
      test = SBA.data_county('ca')
      test.should be_an Array
      test[0]["url"].should == "http://www.acgov.org/"
      test[1]["url"].should == "http://www.alpinecountyca.gov/"
    end
  end
  describe ".data_specific_city" do
    before do
      stub_request(:get, 'http://api.sba.gov/geodata/all_data_for_city_of/seattle/wa.json').
        with().
        to_return(:body => fixture('data_specific_city.json'),
                  :headers => {'Content-Type' => 'application/json'})
    end
    it "should request the correct resource" do
      SBA.data_specific_city('seattle', 'wa')
      a_request(:get, 'http://api.sba.gov/geodata/all_data_for_city_of/seattle/wa.json').
        with().
        should have_been_made
    end
    it "should return the correct results" do
      test = SBA.data_specific_city('seattle', 'wa')
      test.should be_an Array
      test[0]["url"].should == "http://seattle.gov/"
    end
  end
  describe ".data_specific_county" do
    before do
      stub_request(:get, 'http://api.sba.gov/geodata/all_data_for_county_of/frederick%20county/md.json').
        with().
        to_return(:body => fixture('data_specific_county.json'),
                  :headers => {'Content-Type' => 'application/json'})
    end
    it "should request the correct resource" do
      SBA.data_specific_county('frederick county', 'md')
      a_request(:get, 'http://api.sba.gov/geodata/all_data_for_county_of/frederick%20county/md.json').
        with().
        should have_been_made
    end
    it "should return the correct results" do
      test = SBA.data_specific_county('frederick county', 'md')
      test.should be_an Array
      test[0]["url"].should == "http://www.brunswickmd.gov/"
      test[2]["url"].should == "http://www.emmitsburg.net/towngov/"
    end
  end
end
