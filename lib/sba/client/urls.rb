# -*- coding: utf-8 -*-
require 'json'

module SBA
  class Client
    module Urls
    include SBA::Client::Connection
      def all_primary_urls_in_state(state, options={})
        response = get("geodata/primary_city_county_links_for_state_of/#{state}.json", options)
      end
      def all_city_primary_urls_in_state(state, options={})
        response = get("geodata/primary_city_links_for_state_of/#{state}.json", options)
      end
      def all_county_primary_urls_in_state(state, options={})
        response = get("geodata/primary_county_links_for_state_of/#{state}.json", options)
      end
      def primary_url_for_city(city, state, options={})
        response = get("geodata/primary_links_for_city_of/#{city}/#{state}.json", options)
      end
      def all_primary_urls_for_county(county, state, options={})
        response = get("geodata/primary_links_for_county_of/#{county}/#{state}.json", options)
      end
    end
  end
end
