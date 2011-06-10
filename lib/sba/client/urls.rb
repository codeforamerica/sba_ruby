# -*- coding: utf-8 -*-
require 'json'

module SBA
  class Client
    module Urls
    include SBA::Client::Connection
    
      # Returns primary URLS for All Cities and Counties in a State
      #
      # @param state [String] The two letter postal code for the state abbreviation
      # @param options [Hash] A customizable set of options.
      # @return {Hash}
      # @see http://www.sba.gov/content/us-city-and-county-web-data-api-city-county-data-primary-methods#all
      # @example
      #   SBA.all_primary_urls_in_state("ca")    
      def all_primary_urls_in_state(state, options={})
        response = get("geodata/primary_city_county_links_for_state_of/#{state}.json", options)
      end
      
      # Returns primary URLS for All Cities in a State
      #
      # @param state [String] The two letter postal code for the state abbreviation
      # @param options [Hash] A customizable set of options.
      # @return {Hash}
      # @see http://www.sba.gov/content/us-city-and-county-web-data-api-city-county-data-primary-methods#allcity
      # @example
      #   SBA.all_city_primary_urls_in_state("ca")      
      def all_city_primary_urls_in_state(state, options={})
        response = get("geodata/primary_city_links_for_state_of/#{state}.json", options)
      end

      # Returns primary URLS for All Counties in a State
      #
      # @param state [String] The two letter postal code for the state abbreviation
      # @param options [Hash] A customizable set of options.
      # @return {Hash}
      # @see http://www.sba.gov/content/us-city-and-county-web-data-api-city-county-data-primary-methods#allcounty
      # @example
      #   SBA.all_county_primary_urls_in_state("ca")      
      def all_county_primary_urls_in_state(state, options={})
        response = get("geodata/primary_county_links_for_state_of/#{state}.json", options)
      end
      
      # Returns the primary URL for a specific city
      #
      # @param city [String] Input the name of the city, town or village.
      # @param state [String] The two letter postal code for the state abbreviation.
      # @param options [Hash] A customizable set of options.
      # @return {Hash}
      # @see http://www.sba.gov/content/us-city-and-county-web-data-api-city-county-data-primary-methods#city
      # @example
      #   SBA.primary_url_for_city("ca")
      def primary_url_for_city(city, state, options={})
        response = get("geodata/primary_links_for_city_of/#{city}/#{state}.json", options)
      end
      
      # Returns the primary URL for a specific County
      #
      # @param county [String] Input the name of the county (or its equivalent), including the word county in the name
      # @param state [String] The two letter postal code for the state abbreviation.
      # @param options [Hash] A customizable set of options.
      # @return {Hash}
      # @see http://www.sba.gov/content/us-city-and-county-web-data-api-city-county-data-primary-methods#county
      # @example
      #   SBA.all_primary_urls_for_county("king county", "wa")      
      def all_primary_urls_for_county(county, state, options={})
        response = get("geodata/primary_links_for_county_of/#{county}/#{state}.json", options)
      end
      
      # Returns All City and County URLS in a State
      #
      # @param state [String] The two letter postal code for the state abbreviation.
      # @param options [Hash] A customizable set of options.
      # @return {Hash}
      # @see http://www.sba.gov/content/us-city-and-county-web-data-api-city-county-data-all-urls
      # @example
      #   SBA.all_urls_for_city_county("ca")
      def all_urls_city_county(state, options={})
        response = get("geodata/city_county_links_for_state_of/#{state}.json", options)
      end
      
      def all_urls_city(state, options={})
        response = get("geodata/city_links_for_state_of/#{state}.json", options)
      end
    end
  end
end
