require 'net/http'
require 'radiko/download'
require 'radiko/record'

module Radiko
  class Client
    include Radiko::Download
    include Radiko::Record
    attr_reader :auth_token

    def initialize(auth_token = nil)
      @auth_token = auth_token
      @auth_token ||= Radiko::Authorize.new.auth_token
    end

    def perform_get(endpoint)
      perform_request(:get, endpoint)
    end

    def perform_post(endpoint)
      perform_request(:post, endpoint)
    end

    private
    def perform_request(method, endpoint)
      Radiko::Request.new(self, method, endpoint).perform
    end
  end

  class AuthorizeClient
    attr_reader :headers
    def initialize(headers = nil)
      @headers = headers
      @headers ||= Radiko::Headers.authorize_header
    end
  end
end
