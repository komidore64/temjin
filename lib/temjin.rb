require 'formatador'
require 'clamp'
require 'trello' # ruby-trello

require 'temjin/config_command'
require 'temjin/config_command/show_command'
require 'temjin/config_command/init_command'
require 'temjin/card_command'
require 'temjin/card_command/list_command'
require 'temjin/card_command/show_command'
require 'temjin/card_command/add_command'
require 'temjin/list_command'
require 'temjin/main_command'

# cli structure
module Temjin
  ConfigCommand.subcommand("show", "display current configuration", ConfigCommand::ShowCommand)
  ConfigCommand.subcommand("init", "setup configuration", ConfigCommand::InitCommand)
  MainCommand.subcommand("config", "temjin configuration", ConfigCommand)

  MainCommand.subcommand("list", "trello lists", ListCommand)

  CardCommand.subcommand("list", "list cards using optional filters", CardCommand::ListCommand)
  CardCommand.subcommand("show", "display a card's information", CardCommand::ShowCommand)
  CardCommand.subcommand("add", "add a new card", CardCommand::AddCommand)
  MainCommand.subcommand("card", "trello cards", CardCommand)
end
