module Temjin
  class ConfigCommand
    class ShowCommand < Temjin::Command
      def execute
        # TODO: use formatador for all output
        puts "key: #{config.key}"
        puts "token: #{config.token}"
      end
    end
  end
end
