require 'http'

module Radiko
  class Request

    def initialize(client, request_method, path, options = {})
      @client = client
      @request_method = request_method
      @uri = URI.parse(path)
      if client.is_a?(Radiko::AuthorizeClient)
        @headers = client.headers
      else
        @headers = Radiko::Headers.new(client).request_headers
      end
      @options = options
    end

    def perform
      options_key = @request_method == :get ? :params : :form
      response = http_client.headers(@headers).public_send(@request_method, @uri.to_s, options_key => @options)
      response.body
    end

    def http_client
      HTTP
    end
  end
end
