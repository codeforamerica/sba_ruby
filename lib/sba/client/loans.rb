# -*- coding: utf-8 -*-
require 'json'

module SBA
  class Client
    module Loans
    include SBA::Client::Connection
    
      # Returns financing programs available from Federal government agencies and select non-profit organizations nationwide.
      #
      # @param options [Hash] A customizable set of options.
      # @return {Hash}
      # @see http://www.sba.gov/content/loans-grants-search-api-federal-program-method
      # @example
      #   SBA.loan_grants_by_federal   
      def loan_grants_by_federal(options={})
        response = get("loans_grants/federal.json")
      end

      # Returns all small business financing programs sponsored by state government agencies and select non-profit and commercial organizations.
      #
      # @param state [String] input the two leter postal code for the state abbreviation
      # @param options [Hash] A customizable set of options.
      # @return {Hash}
      # @see http://www.sba.gov/content/loans-grants-search-api-programs-specific-state-method
      # @example
      #   SBA.loan_grants_by_state("ca")     
      def loan_grants_by_state(state, options={})
        response = get("loans_grants/state_financing_for/#{state}.json")
      end
      
      # Returns all small business financing programs sponsored by federal and state government agencies and selected non-profit and commercial organizations.
      #
      # @param state [String] input the two leter postal code for the state abbreviation
      # @param options [Hash] A customizable set of options.
      # @return {Hash}
      # @see http://www.sba.gov/content/loans-grants-search-api-federal-and-state-specific-method
      # @example
      #   SBA.loan_grants_by_federal_state("ca")
      def loan_grants_by_federal_state(state, options={})
        response = get("loans_grants/federal_and_state_financing_for/#{state}.json")
      end
      
      # Returns all small business financing programs for a specific industry in all 54 states and territories (when available).
      #
      # @param industry [String] input one of the standard industry values: Agriculture,Child Care,Environmental Management,Health Care,Manufacturing,Technology,Tourism
      # @param options [Hash] A customizable set of options.
      # @return {Hash}
      # @see http://www.sba.gov/content/loans-grants-search-api-industry-method
      # @example
      #   SBA.loan_grants_by_industry("Technology")
      def loan_grants_by_industry(industry, options={})
        response = get("loans_grants/nil/for_profit/#{industry}/nil.json")
      end
      
      # Returns small business special financing programs for certain business owner groups (e.g., women, veterans, minorities, etc.); or business activities (e.g., export, energy efficiency, disaster assistance, etc.).
      #
      # @param industry [String]  input one or more of the standard industry values
      # @param options [Hash] A customizable set of options.
      # @return {Hash}
      # @see http://www.sba.gov/content/loans-grants-search-api-specialty-method
      # @example
      #   SBA.loan_grants_by_specialty("general_purpose")
      #   SBA.loan_grants_by_specialty("general_purpose-rural")
      def loan_grants_by_specialty(specialty, options={})
        response = get("loans_grants/nil/for_profit/nil/#{specialty}.json")
      end
      
      # Returns financing programs for specific industries AND specific business groups (e.g., women, veterans, minorities, etc.); or business activities (e.g., export, energy efficiency, disaster assistance, etc.).
      #
      # @param industry [String]  input one or more of the standard industry values
      # @param specialty [String] input one or more of the stanard industry values
      # @param options [Hash] A customizable set of options.
      # @return {Hash}
      # @see http://www.sba.gov/content/loans-grants-search-api-industry-and-specialty-method
      # @example
      #   SBA.loan_grants_by_industry_specialty("technology", "contractor")
      #   SBA.loan_grants_by_industry_specialty("technology, "general_purpose-rural")      
      def loan_grants_by_industry_specialty(industry, specialty, options={})
        response = get("loans_grants/nil/for_profit/#{industry}/#{specialty}.json")
      end
      
      # Returns all small business financing programs for a specific industry in a specific state.
      #
      # @param state [String]  input the two leterl postal code for state abbreviation
      # @param industry [String]  input one or more of the standard industry values
      # @param options [Hash] A customizable set of options.
      # @return {Hash}
      # @see http://www.sba.gov/content/loans-grants-search-api-state-and-industry-method
      # @example
      #   SBA.loan_grants_by_state_industry("ca", "technology")   
      def loan_grants_by_state_industry(state, industry, options={})
        response = get("loans_grants/#{state}/for_profit/#{industry}/nil.json")
      end

      # Returns state programs for specific business groups or specialized business activities.
      #
      # @param state [String]  input the two leterl postal code for state abbreviation
      # @param specialty [String] input one or more of the stanard industry values
      # @param options [Hash] A customizable set of options.
      # @return {Hash}
      # @see http://www.sba.gov/content/loans-grants-search-api-state-and-specialty-method
      # @example
      #   SBA.loan_grants_by_state_specialty("ca", "development")
      def loan_grants_by_state_specialty(state, specialty, options={})
        response = get("loans_grants/#{state}/for_profit/nil/#{specialty}.json")
      end
      
      # Returns state programs by industry and specific business groups or specialized business activities.
      #
      # @param state [String]  input the two leterl postal code for state abbreviation
      # @param industry [String]  input one or more of the standard industry values
      # @param specialty [String] input one or more of the stanard industry values
      # @param options [Hash] A customizable set of options.
      # @return {Hash}
      # @see http://www.sba.gov/content/loans-grants-search-api-state-industry-and-specialty-method
      # @example
      #   SBA.loan_grants_by_state_industry_specialty("ca","tecnology","development")
      def loan_grants_by_state_industry_specialty(state, industry, specialty, options={})
        response = get("loans_grants/#{state}/for_profit/#{industry}/#{specialty}.json")
      end

    end
  end
end
