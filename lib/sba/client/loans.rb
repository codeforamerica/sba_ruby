# -*- coding: utf-8 -*-
require 'json'

module SBA
  class Client
    module Loans
    include SBA::Client::Connection
    
      def loan_grants_by_federal(options={})
        options.merge!({:format=> "json"})
        response = get("loans_grants/federal.json")
      end

    end
  end
end
