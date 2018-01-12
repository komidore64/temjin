module Temjin
  class CardCommand
    class ListCommand < Clamp::Command
      # TODO: eventually make BOARD and LIST optional, but for now we need them
      parameter 'BOARD', 'trello board'
      parameter 'LIST', 'trello list'

      def execute
        # FIXME: this should probably be moved to a Config class)
        temjin_config = YAML.load_file(ConfigCommand.config_file_path)

        # FIXME: this should probably take place as part of a command's setup
        Trello.configure do |config|
          config.developer_public_key = temjin_config['key']
          config.member_token = temjin_config['token']
        end

        # TODO: should also be included in the command setup
        user = Trello::Member.find(temjin_config['username'])

        cards = user.boards.detect { |b| b.name.match(board) }.lists.detect { |l| l.name.match(list) }.cards

        cards = cards.map do |c|
          { :id => c.id,
            :name => c.name,
            :desc => c.desc }
        end

        cards.each do |card|
          Formatador.display_line("[yellow]#{card[:id]}[/] - #{card[:name]}")
        end
      end
    end
  end
end
