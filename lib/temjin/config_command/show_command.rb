module Temjin
  class ConfigCommand
    class ShowCommand < Clamp::Command
      def execute
        config = YAML.load_file(ConfigCommand.config_file_path)
        # TODO: use formatador for all output
        puts "key: #{config['key']}"
        puts "token: #{config['token']}"
      rescue Errno::ENOENT => _
        # TODO: use formatador for all output
        puts "Configuration file not found. Please run `temjin config init`."
      end
    end
  end
end
