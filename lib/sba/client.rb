require ::File.expand_path('../client/connection', __FILE__)
require ::File.expand_path('../client/request', __FILE__)
require ::File.expand_path('../client/loans.rb', __FILE__)
require ::File.expand_path('../client/licenses.rb', __FILE__)
require ::File.expand_path('../client/sites.rb', __FILE__)
require ::File.expand_path('../client/urls.rb', __FILE__)

module SBA
  class Client
    attr_accessor *Configuration::VALID_OPTIONS_KEYS

    def initialize(options={})
      options = SBA.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end

    include SBA::Client::Connection
    include SBA::Client::Request
    include SBA::Client::Urls
    include SBA::Client::Loans
    include SBA::Client::Licenses
    include SBA::Client::Sites  
    
    # Returns results for a matching license or permit category for each 54 states and territories. 
    #
    # @param options [Hash] A customizable set of options.
    # @option options category [String]  category corresponds to a requirement that generally applies to all businesses
    # @return [Array<Hashie::Mash>]
    # @example
    #   @client = SBA.new
    #   @client.by_category("doing business as")
    def by_category(category, options={})
      get("/license_permit/by_category/#{category}.json", options)
    end
    
              
  end
end
