# -*- coding: utf-8 -*-
require 'JSON'

module SBA
  class Client
    module Urls
    include SBA::Client::Connection
      def all_primary_urls_in_state(state, options={})
        options.merge!({:format=> "json"})
        response = get("geodata/primary_city_county_links_for_state_of/#{state}.json")
      end
      def all_city_primary_urls_in_state(state, options={})
        options.merge!({:format => "json"})
        response = get("geodata/primary_city_links_for_state_of/#{state}.json")
      end
      def all_county_primary_urls_in_state(state, options={})
        options.merge!({:format => "json"})
        response = get("geodata/primary_county_links_for_state_of/#{state}.json")
      end
    end
  end
end
