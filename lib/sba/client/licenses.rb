# -*- coding: utf-8 -*-
require 'json'

module SBA
  class Client
    module Licenses
    
      include SBA::Client::Connection
      
      def by_category(category, options={})
        options.merge!({:format=> "json"})
        response = get("/license_permit/by_category/#{category}.json")
        simplify_response(response)
      end
    
      def by_state(state, options={})
        options.merge!({:format=> "json"})
        response = get("/license_permit/all_by_state/#{state}.json", options)
        simplify_response(response)
      end
      
      private
      def simplify_response(response)
        #the returned 'key' is pretty useless. the key=>value thing here is basically an array
        #within that, we're given an array of key=>value pairs. we want this to be one big hash.
        response.map {|key,value| value.inject({}) {|all,current| all.merge! current}}
      end
      
    end
  end
end
