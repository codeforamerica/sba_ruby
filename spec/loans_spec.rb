require 'helper'

describe SBA do
  after do
    SBA.reset
  end

  describe ".respond_to?" do
    it "should return true if method exists" do
      SBA.respond_to?(:client, true).should be_true
    end
  end

  describe ".client" do
    it "should be a SBA::Client" do
      SBA.client.should be_a SBA::Client
    end
  end
end

