module Temjin
  class CardCommand
    class MineCommand < Temjin::TrelloAPICommand
      def execute
        user = find_user(config.username)

        cards = user.cards(:filter => 'visible')

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
