require ::File.expand_path('../sba/version', __FILE__)
require ::File.expand_path('../sba/configuration.rb', __FILE__)
require ::File.expand_path('../sba/client', __FILE__)

module SBA
  extend Configuration

  # Alias for SBA::Client.new
  #
  # @return [SBA::Client]
  def self.client(options={})
    SBA::Client.new(options)
  end

  # Delegate to SBA::Client
  def self.method_missing(method, *args, &block)
    return super unless client.respond_to?(method)
    client.send(method, *args, &block)
  end
  
  def self.respond_to?(method, include_private=false)
    client.respond_to?(method, include_private) || super(method, include_private)
  end

  # Custom error class for rescuing from all SBA errors
  class Error < StandardError; end

  # Raised when SBA returns a 400 HTTP status code
  class BadRequest < Error; end

  # Raised when SBA returns a 401 HTTP status code
  class Unauthorized < Error; end

  # Raised when SBA returns a 403 HTTP status code
  class Forbidden < Error; end

  # Raised when SBA returns a 404 HTTP status code
  class NotFound < Error; end

  # Raised when SBA returns a 406 HTTP status code
  class NotAcceptable < Error; end

  # Raised when SBA returns a 500 HTTP status code
  class InternalServerError < Error; end

  # Raised when SBA returns a 502 HTTP status code
  class BadGateway < Error; end

  # Raised when SBA returns a 503 HTTP status code
  class ServiceUnavailable < Error; end
end
