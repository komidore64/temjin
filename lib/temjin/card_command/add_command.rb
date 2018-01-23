module Temjin
  class CardCommand
    class AddCommand < Temjin::TrelloAPICommand
      parameter 'BOARD', 'board name'
      parameter 'LIST', 'list name'
      parameter '[CARD_NAME]', 'name of card to add'

      option '--desc', 'DESC', 'card description'

      def execute
        # TODO: should also be included in the command setup
        user = Trello::Member.find(config.username)

        list_id = user.boards.detect { |b| b.name.match(board) }.lists.detect { |l| l.name.match(list) }.id

        create_options = {}
        create_options[:list_id] = list_id
        create_options[:name] = card_name if card_name
        create_options[:desc] = desc if desc

        new_card = Trello::Card.create(create_options)
        Formatador.display_line("[[yellow]#{new_card.id}[/]] added")
      end
    end
  end
end
