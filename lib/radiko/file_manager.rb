module Radiko
  class FileManager
    class << self
      PLAYER_URL = 'http://radiko.jp/apps/js/flash/myplayer-release.swf'
      PLAYER_PATH = File.expand_path('../tmp/player.swf', __FILE__)
      KEYFILE_PATH = File.expand_path('../tmp/keyfile.png', __FILE__)

      def create_keyfile
        check_dir
        fetch_player
        `swfextract -b 12 #{PLAYER_PATH} -o #{KEYFILE_PATH}`
        KEYFILE_PATH
      end

      def fetch_player
        check_dir
        `wget -q -O #{PLAYER_PATH} #{PLAYER_URL}`
        PLAYER_PATH
      end

      private
      def check_dir
        dir = File.expand_path('../tmp', __FILE__)
        unless Dir.exist? dir
          FileUtils.mkdir_p dir
        end
      end
    end
  end
end
