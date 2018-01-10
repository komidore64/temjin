module Temjin
  class ConfigCommand < Clamp::Command
    def self.config_file_path
      @config_file_path ||= File.join(ENV['HOME'], '.config', 'temjin.yml')
    end
  end
end
