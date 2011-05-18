require 'helper'

describe SBA, ".all_sites" do
  before do
    stub_request(:get, 'http://api.sba.gov/rec_sites/all_sites/keywords').
    with(:query => {:format => 'xml'}).
    to_return(:body => fixture('all_sites_keywords.xml'), :headers => {'Content-Type' => 'text/xml; charset=utf-8'})
  end

  it "should request the correct resource" do
    SBA.all_sites()
    a_request(:get, 'http://api.sba.gov/rec_sites/all_sites/keywords').
    with(:query => {:format => 'xml'}).
    should have_been_made
  end

  it "should return the correct results" do
    test = SBA.all_sites()
    test.should be_an Hash
    test["site"]["link_title"].should == "Changing a Business Name"
  end
end