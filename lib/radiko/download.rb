module Radiko
  module Download
    def download(station_id, ft, to, output)
      url = "https://radiko.jp/v2/api/ts/playlist.m3u8?station_id=#{station_id}&ft=#{ft}&to=#{to}"
      response = perform_get(url)
      playlist_url = response.to_s.lines.find { |line| line.include? "https://" }.chomp
      `ffmpeg -i #{playlist_url} -bsf aac_adtstoasc "#{output}" &> /dev/null`
    end
  end
end
