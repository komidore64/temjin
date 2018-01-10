module Temjin
  class ShowCommand < Clamp::Command
    def execute
      config = YAML.load_file(ConfigCommand.config_file_path)
      puts "key: #{config['key']}"
      puts "token: #{config['token']}"
    rescue Errno::ENOENT => _
      puts "Configuration file not found. Please run `temjin config init`."
    end
  end
end
