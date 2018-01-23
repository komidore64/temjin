module Temjin
  class CardCommand
    class ListCommand < Temjin::TrelloAPICommand
      # TODO: eventually make BOARD and LIST optional, but for now we need them
      parameter 'BOARD', 'trello board'
      parameter 'LIST', 'trello list'

      def execute
        # TODO: should also be included in the command setup
        user = Trello::Member.find(config.username)

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
