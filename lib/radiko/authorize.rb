module Radiko
  class Authorize

    def auth_token
      client = Radiko::AuthorizeClient.new
      response = Radiko::Request.new(client, :post, 'https://radiko.jp/v2/api/auth1_fms').perform
      values = response.to_s.lines.map { |field| field.split("=") }
      @auth_token = values.find { |key, value| key.downcase == "x-radiko-authtoken" }.last.chomp
      offset = values.find {      |key, value| key.downcase == "x-radiko-keyoffset" }.last.chomp
      length = values.find {      |key, value| key.downcase == "x-radiko-keylength" }.last.chomp
      keyfile = Radiko::FileManager.create_keyfile
      @partialkey = `dd if=#{keyfile} bs=1 skip=#{offset} count=#{length} 2> /dev/null | base64`.chomp
      register_token
      @auth_token
    end

    def register_token
      headers = Radiko::Headers.authorize_header
      headers['X-Radiko-Partialkey'] = @partialkey
      headers['X-Radiko-AuthToken'] = @auth_token
      client = Radiko::AuthorizeClient.new(headers)
      Radiko::Request.new(client, :post, 'https://radiko.jp/v2/api/auth2_fms').perform
    end
  end
end
