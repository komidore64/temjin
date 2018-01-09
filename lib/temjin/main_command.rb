module Temjin
  class MainCommand < Clamp::Command
    option ['-v', '--version'], :flag, 'display version' do
      puts Temjin.version
      exit
    end
  end

  MainCommand.subcommand("list", "trello lists", ListCommand)
  MainCommand.subcommand("card", "trello cards", CardCommand)
end
