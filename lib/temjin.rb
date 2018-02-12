require 'yaml'
require 'formatador'
require 'clamp'
require 'trello' # ruby-trello

# beta feature
Clamp.allow_options_after_parameters = true

require 'temjin/configuration_not_found_error'
require 'temjin/config'
require 'temjin/command_helpers/board'
require 'temjin/command_helpers/list'
require 'temjin/command'

require 'temjin/config_command'
require 'temjin/config_command/show_command'
require 'temjin/config_command/init_command'
require 'temjin/card_command'
require 'temjin/card_command/list_command'
require 'temjin/card_command/show_command'
require 'temjin/card_command/add_command'
require 'temjin/card_command/update_command'
require 'temjin/card_command/mine_command'
require 'temjin/list_command'
require 'temjin/main_command'

# cli structure
module Temjin
  ConfigCommand.subcommand("show", "display current configuration", ConfigCommand::ShowCommand)
  ConfigCommand.subcommand("init", "setup configuration", ConfigCommand::InitCommand)
  MainCommand.subcommand("config", "temjin configuration", ConfigCommand)

  CardCommand.subcommand("list", "list cards using optional filters", CardCommand::ListCommand)
  CardCommand.subcommand("show", "display a card's information", CardCommand::ShowCommand)
  CardCommand.subcommand("add", "add a new card", CardCommand::AddCommand)
  CardCommand.subcommand("update", "update a card", CardCommand::UpdateCommand)
  CardCommand.subcommand("mine", "display my cards", CardCommand::MineCommand)
  MainCommand.subcommand(["card", "cards"], "trello cards", CardCommand)
end

# added usage error messages
Clamp.messages = {:option_required_by => "option '%<option>s' is required by '%<by>s'"}
