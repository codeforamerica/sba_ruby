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
    it "should have the correct response"
  end
end
