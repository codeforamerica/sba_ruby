require 'simplecov'
SimpleCov.start do
  add_group 'SBA', 'lib/sba'
  add_group 'Faraday', 'lib/faraday'
end

require File.expand_path('../../lib/sba', __FILE__)
require 'rspec'
require 'webmock/rspec'

require 'sba'

RSpec.configure do |config|
  config.include WebMock::API
end

def stub_get(path)
  stub_request(:get, 'http://api.sba.gov/' + path)
end

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end