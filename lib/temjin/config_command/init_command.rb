module Temjin
  class ConfigCommand
    class InitCommand < Temjin::Command
      def config # override
        @config ||= Config.new(:create => true)
      end

      def prompt(message, default = nil)
        print(message)
        result = $stdin.gets.chomp
        result.empty? ? default : result
      end

      def execute
        # TODO: use Formatador for all output
        puts 'Go to https://trello.com/app-key to get your key and token.'
        puts

        config.username = prompt('username: ')
        config.key = prompt('key: ')
        config.token = prompt('token: ')

        config.save!
      end
    end
  end
end
