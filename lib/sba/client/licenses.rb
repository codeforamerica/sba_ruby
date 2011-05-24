# -*- coding: utf-8 -*-
require 'json'

module SBA
  class Client
    module Licenses
    include SBA::Client::Connection
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
    
      def by_state(state, options={})
        get("/license_permit/all_by_state/#{state}.json", options)
      end
    end
  end
end
