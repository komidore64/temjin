module Temjin
  class ConfigCommand
    class ShowCommand < Temjin::Command
      def execute
        # TODO: use formatador for all output
        puts "key: #{config.key}"
        puts "token: #{config.token}"
        puts "default_board: #{config.default_board}"
      end
    end
  end
end
