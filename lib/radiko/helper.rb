module Radiko
  module Helper
    def self.shell_exec(command)
      output = `#{command}`
      status = $?

      unless status.success?
        abort "failed to exec '#{command}'"
      end
      output
    end
  end
end
