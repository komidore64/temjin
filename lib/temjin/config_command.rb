module Temjin
  class ConfigCommand < Clamp::Command
    def self.config_file_path
      @config_file_path ||= File.join(ENV['HOME'], '.config', 'temjin.yml')
    end

    subcommand "show-all", "display current configuration" do
      def execute
        config = YAML.load_file(ConfigCommand.config_file_path)
        puts "key: #{config['key']}"
        puts "token: #{config['token']}"
      rescue Errno::ENOENT => _
        puts "Configuration file not found. Please run `temjin config init`."
      end
    end

    subcommand "init", "setup configuration" do
      def prompt(message, default = nil)
        print(message)
        result = STDIN.gets.chomp
        result.empty? ? default : result
      end

      def execute
        config = {}

        puts "Go to https://trello.com/app-key to get your key and token."
        puts

        config['key'] = prompt("key: ")
        config['token'] = prompt("token: ")

        File.open(ConfigCommand.config_file_path, "w") do |f|
          f.write config.to_yaml
        end
      end
    end
  end
end
