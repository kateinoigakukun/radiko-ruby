module Radiko
  class Headers
    def initialize(client)
      @client = client
    end

    def request_headers
      headers = {}
      headers['X-Radiko-AuthToken'] = @client.auth_token
      headers
    end

    class << self

      APP_VERSION = '4.0.0'
      USER_MODE = 'test-stream'
      APP_KIND = 'pc_ts'
      APP_DEVICE = 'pc'

      def authorize_header
        headers = {}
        headers['X-Radiko-App-Version'] = APP_VERSION
        headers['X-Radiko-User'] = USER_MODE
        headers['X-Radiko-App'] = APP_KIND
        headers['X-Radiko-Device'] = APP_DEVICE
        headers
      end
    end
  end
end
