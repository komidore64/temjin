module Temjin
  class ConfigCommand < Clamp::Command

    subcommand "show-all", "display current configuration" do
      def execute
        config = YAML.load_file(File.join(ENV['HOME'], '.config', 'temjin.yml'))
        puts "app_key: #{config['app_key']}"
        puts "user_token: #{config['user_token']}"
      rescue Errno::ENOENT => _
        puts "configuration file has not been created yet. please run `temjin config init`"
      end
    end

    subcommand "init", "setup configuration" do
      def prompt(message, default = nil)
        print("%s " % message)
        result = STDIN.gets.chomp
        result.empty? ? default : result
      end

      def execute
        config = {}

        puts "Navigate to https://trello.com/app-key to get your app key and user token."
        puts

        config['app_key'] = prompt("app key:")
        config['user_token'] = prompt("user token:")

        File.open(File.join(ENV['HOME'], '.config', 'temjin.yml'), "w") do |file|
          file.write config.to_yaml
        end
      end
    end

  end
end
