# -*- coding: utf-8 -*-
require 'json'

module SBA
  class Client
    module Data
    include SBA::Client::Connection
    
      # Returns Data for all Cities and Counties in a State
      #
      # @param state [String]  Input the two leter postal code for state abbreviation.
      # @param options [Hash] A customizable set of options.
      # @return {Array}
      # @see http://www.sba.gov/content/us-city-and-county-web-data-api-city-county-data-all-data-methods
      # @example
      #   SBA.data_city_county("ca")
      def data_city_county(state,options={})
        response = get("geodata/city_county_data_for_state_of/#{state}.json", options)
      end
      
      # Returns Data for all Cities in a State
      #
      # @param state [String]  Input the two leter postal code for state abbreviation.
      # @param options [Hash] A customizable set of options.
      # @return {Array}
      # @see http://www.sba.gov/content/us-city-and-county-web-data-api-city-county-data-all-data-methods
      # @example
      #   SBA.data_city("ca")
      def data_city(state, options={})
        response = get("geodata/city_data_for_state_of/#{state}.json", options)
      end

      # Returns Data for all Counties in a State
      #
      # @param state [String]  Input the two leter postal code for state abbreviation.
      # @param options [Hash] A customizable set of options.
      # @return {Array}
      # @see http://www.sba.gov/content/us-city-and-county-web-data-api-city-county-data-all-data-methods
      # @example
      #   SBA.data_county("ca")      
      def data_county(state, options={})
        response = get("geodata/county_data_for_state_of/#{state}.json", options)
      end
      
      # Returns Data for a specific City
      #
      # @param city [String]  Input the name of the city 
      # @param state [String]  Input the two leter postal code for state abbreviation.
      # @param options [Hash] A customizable set of options.
      # @return {Array}
      # @see http://www.sba.gov/content/us-city-and-county-web-data-api-city-county-data-all-data-methods
      # @example
      #   SBA.data_specific_city("ca")
      def data_specific_city(city, state, options={})
        response = get("geodata/all_data_for_city_of/#{city}/#{state}.json", options)
      end

      # Returns Data for a specific County
      #
      # @param county [String]  Input the name of the County
      # @param state [String]  Input the two leter postal code for state abbreviation.
      # @param options [Hash] A customizable set of options.
      # @return {Array}
      # @see http://www.sba.gov/content/us-city-and-county-web-data-api-city-county-data-all-data-methods
      # @example
      #   SBA.data_specific_county("orange county", "ca")
      def data_specific_county(county, state, options={})
        response = get("geodata/all_data_for_county_of/#{county}/#{state}.json", options)
      end
      
    end
  end
end
