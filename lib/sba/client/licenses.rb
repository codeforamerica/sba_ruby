# -*- coding: utf-8 -*-
require 'json'

module SBA
  class Client
    module Licenses
    
      include SBA::Client::Connection
      
      # Returns results for a matching license or permit category for each 54 states and territories. 
      #
      # @param category [String] One of the following categories: doing business as, entity filing, employer requirements, states licenses, tax registration
      # @param options [Hash] A customizable set of options.
      # @return {Hash}
      # @see http://www.sba.gov/content/business-licenses-permits-api-category-method
      # @example
      #   SBA.by_category("doing business as")
      def by_category(category, options={})
        options.merge!({:format=> "json"})
        response = get("/license_permit/by_category/#{category}.json")
        simplify_response(response)
      end
      
      # Returns all business licenses for all business types required to operate in an specific state or territory.
      #
      # @param state [String] input the two letter postal code for the state abbreviation.
      # @param options [Hash] A customizable set of options.
      # @return {Hash}
      # @see http://www.sba.gov/content/business-licenses-permits-api-state-method
      # @example
      #   SBA.by_state("ca")
      def by_state(state, options={})
        options.merge!({:format=> "json"})
        response = get("/license_permit/all_by_state/#{state}.json", options)
        simplify_response(response)
      end
      
      # Returns business licenses and permits required for a specific type of business for all 54 states and territories
      #
      # @param business [String] The business_type parameter includes standard values that allow you to return license and permit information for a specific type of business or for specific employer requirements
      # @param options [Hash] A customizable set of options.
      # @return {Hash}
      # @see http://www.sba.gov/content/business-licenses-permits-api-business-type-method
      # @example
      #   SBA.by_business_type("child care services") 
      def by_business_type(business, options={})
        response = get("license_permit/by_business_type/#{business}.json", options)
        simplify_response(response)
      end
      
    end
  end
end
