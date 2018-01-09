module Temjin
  class MainCommand < Clamp::Command
    option ['-v', '--version'], :flag, 'display version' do
      puts Temjin.version
      exit
    end
  end

  MainCommand.subcommand("config", "temjin configuration", ConfigCommand)
  MainCommand.subcommand("list", "trello lists", ListCommand)
  MainCommand.subcommand("card", "trello cards", CardCommand)
end
