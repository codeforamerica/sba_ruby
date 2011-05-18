require 'faraday'

# @api private
module Faraday
  class Response::RaiseError < Response::Middleware
    def on_complete(response)
      case response[:status].to_i
      when 400
        raise SBA::BadRequest, error_message(response)
      when 401
        raise SBA::Unauthorized, error_message(response)
      when 403
        raise SBA::Forbidden, error_message(response)
      when 404
        raise SBA::NotFound, error_message(response)
      when 406
        raise SBA::NotAcceptable, error_message(response)
      when 500
        raise SBA::InternalServerError, error_message(response)
      when 502
        raise SBA::BadGateway, error_message(response)
      when 503
        raise SBA::ServiceUnavailable, error_message(response)
      end
    end

    def error_message(response)
      "#{response[:method].to_s.upcase} #{response[:url].to_s}: #{response[:response_headers]['status']}#{(': ' + response[:body]['error']) if response[:body] && response[:body]['error']}"
    end
  end
end