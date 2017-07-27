require 'http'

module Radiko
  module Record
    CONTENT_URL = "rtmpe://f-radiko.smartstream.ne.jp"

    def record(station_id, duration, output)
      app_name = "#{station_id}/_definst_"
      playpath = "simul-stream.stream"
      date = DateTime.now.strftime("%Y-%m-%d-%H-%M-%S")
      flv_path = File.expand_path("../tmp/#{station_id}_#{date}.flv", __FILE__)
      `rtmpdump -v \
         -r #{CONTENT_URL} \
         --app #{app_name} \
         --playpath #{playpath} \
         -C S:"" -C S:"" -C S:"" -C S:#{@auth_token} \
         --live \
         --stop #{duration} \
         --flv "#{flv_path}"`
      `ffmpeg -y -i "#{flv_path}" -acodec libmp3lame -ab 128k "#{output}"`
    end
  end
end
