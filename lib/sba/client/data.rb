# -*- coding: utf-8 -*-
require 'json'

module SBA
  class Client
    module Data
    include SBA::Client::Connection
    

      def data_city_county(state,options={})
        response = get("geodata/city_county_data_for_state_of/#{state}.json", options)
      end
    end
  end
end
