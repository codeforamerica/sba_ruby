# -*- coding: utf-8 -*-
require 'json'

module SBA
  class Client
    module Licenses
    include SBA::Client::Connection
      def by_category(category, options={})
        options.merge!({:format=> "json"})
        response = get("/license_permit/by_category/#{category}.json")
      end
    
      def by_state(state, options={})
        options.merge!({:format=> "json"})
        resonse = get("/license_permit/all_by_state/#{state}.json", options)
      end
    end
  end
end
