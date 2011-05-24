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
      options.merge!({:format => "xml"})                
      response = get('rec_sites/all_sites/keywords', options)
      response["result"]["rec_sites"]
    end


    end
  end
end
