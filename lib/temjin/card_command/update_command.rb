module Temjin
  class CardCommand
    class UpdateCommand < Clamp::Command
      parameter 'CARD_ID', 'card ID'

      option '--name', 'NAME', 'card name'
      option '--desc', 'DESC', 'card description'

      def execute
        # FIXME: this should be moved to a Config class)
        temjin_config = YAML.load_file(ConfigCommand.config_file_path)

        # FIXME: this should take place as part of a command's setup
        Trello.configure do |config|
          config.developer_public_key = temjin_config['key']
          config.member_token = temjin_config['token']
        end

        card = Trello::Card.find(card_id)

        card.name = name if name
        card.desc = desc if desc

        card.save
        Formatador.display_line("[[yellow]#{card.id}[/]] updated")
      end
    end
  end
end
