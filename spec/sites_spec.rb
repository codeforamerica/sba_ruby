require 'helper'

describe SBA, ".all_sites" do
  before do
    stub_request(:get, 'http://api.sba.gov/rec_sites/all_sites/keywords.json').
      to_return(:body => fixture('all_sites_keywords.json'), :headers => {'Content-Type' => 'text/json; charset=utf-8'})
  end

  it "should request the correct resource" do
    SBA.all_sites()
    a_request(:get, 'http://api.sba.gov/rec_sites/all_sites/keywords.json').
    should have_been_made
  end

  it "should return the correct results" do
    test = SBA.all_sites()
    test.should be_a Hash
    test["recommended_sites_item150"][0]["title"] == "Tax Help and Training"
  end
end

describe ".sites_by_keywords" do
  before do
    stub_request(:get, 'http://api.sba.gov/rec_sites/keywords/contracting.json').
      with().
      to_return(:body => fixture('rec_sites_keyword.json'),
                :headers => {'Content-Type' => 'application/json'})
  end
  it "should request the correct resource" do
    SBA.sites_by_keyword("contracting")
    a_request(:get, 'http://api.sba.gov/rec_sites/keywords/contracting.json').
      with().
      should have_been_made
  end
  it "should return the correct results" do
    test = SBA.sites_by_keyword("contracting")
    test.should be_a Hash
     test["recommended_sites_item0"][0]["title"] == "How to Find Contracting Opportunities"
  end
end

describe ".sites_by_category" do
  before do
    stub_request(:get, 'http://api.sba.gov/rec_sites/category/managing%20a%20business.json').
      with().
      to_return(:body => fixture('rec_sites_categories.json'),
                :headers => {'Content-Type' => 'application/json'})
  end
  it "should request the correct resource" do
    SBA.sites_by_category("managing a business")
    a_request(:get, 'http://api.sba.gov/rec_sites/category/managing%20a%20business.json').
      with().
      should have_been_made
  end
  it "should return the correct results" do
    test = SBA.sites_by_category("managing a business")
    test.should be_a Hash
     test["recommended_sites_item5"][0]["title"] == "Demographics and Population Statistics"
  end
end

describe ".sites_by_master_term" do
  before do
    stub_request(:get, 'http://api.sba.gov/rec_sites/keywords/master_term/export.json').
      with().
      to_return(:body => fixture('rec_sites_master_term.json'),
                :headers => {'Content-Type' => 'application/json'})
  end
  it "should request the correct resource" do
    SBA.sites_by_master_term("export")
    a_request(:get, 'http://api.sba.gov/rec_sites/keywords/master_term/export.json').
      with().
      should have_been_made
  end
  it "should return the correct results" do
    test = SBA.sites_by_master_term("export")
    test.should be_a Hash
     test["recommended_sites_item0"][0]["url"] == "http://www.sba.gov/content/exporting-and-importing"
  end
end

