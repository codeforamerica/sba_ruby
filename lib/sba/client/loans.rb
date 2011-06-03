# -*- coding: utf-8 -*-
require 'json'

module SBA
  class Client
    module Loans
    include SBA::Client::Connection
      def loan_grants_by_federal(options={})
        response = get("loans_grants/federal.json")
      end
      
      def loan_grants_by_state(state, options={})
        response = get("loans_grants/state_financing_for/#{state}.json")
      end
      
      def loan_grants_by_federal_state(state, options={})
        response = get("loans_grants/federal_and_state_financing_for/#{state}.json")
      end

    end
  end
end
