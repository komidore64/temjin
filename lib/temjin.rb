require 'clamp'
require 'trello' # ruby-trello

require 'temjin/config_command'
require 'temjin/config_command/show_command'
require 'temjin/config_command/init_command'
require 'temjin/card_command'
require 'temjin/list_command'
require 'temjin/main_command'

# cli structure
module Temjin
  ConfigCommand.subcommand("show", "display current configuration", ShowCommand)
  ConfigCommand.subcommand("init", "setup configuration", InitCommand)
  MainCommand.subcommand("config", "temjin configuration", ConfigCommand)

  MainCommand.subcommand("list", "trello lists", ListCommand)

  MainCommand.subcommand("card", "trello cards", CardCommand)
end
