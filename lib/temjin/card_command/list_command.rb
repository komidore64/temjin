module Temjin
  class CardCommand
    class ListCommand < Temjin::TrelloAPICommand
      list_option

      def execute
        # TODO: should also be included in the command setup
        user = find_user(config.username)

        cards = if list
                  # FIXME: cards(:filter => 'visible') seems to be broken? the api is returning 400 'invalid value for filter'
                  find_list(user, board, list).cards
                else
                  user.boards.detect { |b| b.name.match(board) }.cards(:filter => 'visible')
                end

        cards = cards.map do |c|
          {:id => c.id,
           :name => c.name}
        end

        cards.each do |card|
          Formatador.display_line("[yellow]#{card[:id]}[/] - #{card[:name]}")
        end
      end
    end
  end
end
