module Temjin
  class CardCommand
    class UpdateCommand < Temjin::TrelloAPICommand
      parameter 'CARD_ID', 'card ID'

      option '--name', 'NAME', 'card name'
      option '--desc', 'DESC', 'card description'

      def execute
        card = find_card(card_id)

        card.name = name if name
        card.desc = desc if desc

        card.save
        Formatador.display_line("[[yellow]#{card.id}[/]] updated")
      end
    end
  end
end
