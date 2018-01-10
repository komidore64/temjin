module Temjin
  class InitCommand < Clamp::Command
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