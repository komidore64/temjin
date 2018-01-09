module Temjin
  class MainCommand < Clamp::Command; end

  MainCommand.subcommand("list", "Actions related to lists", ListCommand)
  MainCommand.subcommand("card", "Actions related to cards", CardCommand)
end
