require 'helper'

describe SBA do

  describe "all_primary_urls_in_state" do
    before do
      stub_request(:get, 'http://api.sba.gov/geodata/primary_city_county_links_for_state_of/ks.json').
        with().
        to_return(:body => fixture('city_links_for_state.json'),
                  :headers => {'Content-Type' => 'application/json'})
    end
    it "should request the correct resource" do
      SBA.all_primary_urls_in_state('ks')
      a_request(:get, 'http://api.sba.gov/geodata/primary_city_county_links_for_state_of/ks.json').
        with().
        should have_been_made
    end
    it "should return the correct results" do
      test = SBA.all_primary_urls_in_state('ks')
      test.should be_an Array
      test[0]["url"].should == "http://www.abilenecityhall.com/"
      test[1]["url"].should == "http://www.andoverks.com/"
    end
  end
  describe ".all_city_primary_urls_for_state" do
    before do
      stub_request(:get, 'http://api.sba.gov/geodata/primary_city_links_for_state_of/ks.json').
        with().
        to_return(:body => fixture('city_links_for_state.json'),
                  :headers => {'Content-Type' => 'application/json'})
    end
    it "should request the correct resource" do
      SBA.all_city_primary_urls_in_state('ks')
      a_request(:get, 'http://api.sba.gov/geodata/primary_city_links_for_state_of/ks.json').
        with().
        should have_been_made
    end
    it "should return the correct results" do
      test = SBA.all_city_primary_urls_in_state('ks')
      test.should be_an Array
      test[0]["url"].should == "http://www.abilenecityhall.com/"
      test[1]["url"].should == "http://www.andoverks.com/"
    end
  end
  describe ".all_county_primary_urls_for_state" do
    before do
      stub_request(:get, 'http://api.sba.gov/geodata/primary_county_links_for_state_of/ks.json').
        with().
        to_return(:body => fixture('city_links_for_state.json'))
    end
    it "should request the correct resource" do
      SBA.all_county_primary_urls_in_state('ks')
      a_request(:get, 'http://api.sba.gov/geodata/primary_county_links_for_state_of/ks.json').
        with().
        should have_been_made
    end
    it "should have the correct response" do 
      test = SBA.all_county_primary_urls_in_state('ks')
      test.should be_an Array
      test[0]["url"].should == "http://www.abilenecityhall.com/"
    end
  end
  describe ".primary_url_for_city" do
    before do
      stub_request(:get, 'http://api.sba.gov/geodata/primary_links_for_city_of/athens/ga.json').
        with().
        to_return(:body => fixture('primary_url_for_athens.json'))
    end
    it "should request the correct resource" do
      SBA.primary_url_for_city('athens', 'ga')
      a_request(:get, 'http://api.sba.gov/geodata/primary_links_for_city_of/athens/ga.json').
        with().
        should have_been_made
    end
    it "should have the correct response" do
      result = SBA.primary_url_for_city('athens', 'ga')
      result[0]['url'].should == 'http://www.athensclarkecounty.com/'
    end
  end
  describe ".all_primary_urls_for_county" do
    before do
      stub_request(:get, 'http://api.sba.gov/geodata/primary_links_for_county_of/clarke%20county/ga.json').
        with().
        to_return(:body => fixture('primary_url_for_clarke_county.json'))
    end
    it "should request the correct resource" do
      SBA.all_primary_urls_for_county('clarke county', 'ga')
      a_request(:get, 'http://api.sba.gov/geodata/primary_links_for_county_of/clarke%20county/ga.json').
        with().
        should have_been_made
    end
    it "should get the correct data" do
      result = SBA.all_primary_urls_for_county('clarke county', 'ga')
      result[0]['url'].should == 'http://www.athensclarkecounty.com/'
      result[1]['url'].should == 'http://www.cityofwinterville.com/'
    end
  end
end
