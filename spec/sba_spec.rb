require 'helper'

describe SBA do
  describe ".client" do
    it "should be a SBA::Client" do
      SBA.client.should be_a SBA::Client
    end
  end
end