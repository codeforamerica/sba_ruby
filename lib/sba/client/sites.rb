# -*- coding: utf-8 -*-
require 'json'

module SBA
  class Client
    module Sites
    include SBA::Client::Connection

      # Returns all recommended sites for all keywords and phrases.
      #
      # @format :xml
      # @return {Hash}
      # @see http://www.sba.gov/about-sba-services/7630#all
      # @example Returns recommended sites for keywords and phrases
      #   SBA.all_sites
      def all_sites(options={})
        response = get("rec_sites/all_sites/keywords.json", options)
        #simplify_response(response)
      end
    
      # Returns all recommended sites for a specific keyword.
      #
      # @param keyword [String] A search word or phrase.
      # @param options [Hash] A customizable set of options.
      # @return {Hash}
      # @see http://www.sba.gov/about-sba-services/7630#keyword
      # @example
      #   SBA.sites_by_keyword("contracting")     
      def sites_by_keyword(keyword, options={})
        response = get("rec_sites/keywords/#{keyword}.json", options)
      end

      # Returns all recommended sites for a specific category.
      #
      # @param category [String] Name of standard category.
      # @param options [Hash] A customizable set of options.
      # @return {Hash}
      # @see http://www.sba.gov/about-sba-services/7630#category
      # @example
      #   SBA.sites_by_category("managing a business")    
      def sites_by_category(category, options={})
        response = get("rec_sites/category/#{category}.json", options)
      end

      # Returns all recommended sites assigned a specific master term.
      #
      # @param term [String] A standard search word or phrase assigned to group of synonyms
      # @param options [Hash] A customizable set of options.
      # @return {Hash}
      # @see http://www.sba.gov/about-sba-services/7630#master
      # @example
      #   SBA.sites_by_master_term("export")
      def sites_by_master_term(term, options={})
        response = get("rec_sites/keywords/master_term/#{term}.json", options)
      end

      # Returns all recommended sites belonging to a specific domain
      #
      # @param domain [String] Domain name without the www or .com, .gov, .net
      # @param options [Hash] A customizable set of options.
      # @return {Hash}
      # @see http://www.sba.gov/about-sba-services/7630#category
      # @example
      #   SBA.sites_by_domain("irs")    
      def sites_by_domain(domain, options={})
        response = get("rec_sites/keywords/domain/#{domain}.json", options)
      end

    end
  end
end
