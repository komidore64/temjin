module Temjin
  class CardCommand
    class ShowCommand < Temjin::TrelloAPICommand
      parameter 'CARD_ID', 'card ID'

      def execute
        card = Trello::Card.find(card_id)
        list = Trello::List.find(card.list_id)
        board = Trello::Board.find(card.board_id)
        members = card.member_ids.map { |member| Trello::Member.find(member).username }
        labels = card.labels.map { |label| label.name }

        Formatador.display_line("# [bold]#{card.name}[/]")
        Formatador.indent do
          Formatador.display_line("-> #{list.name} --> #{board.name}")
        end
        Formatador.display_line("[[yellow]#{card.id}[/]] #{card.short_url} #{card.attachments.empty? ? '' : '+attachments '}- #{card.closed? ? '[_red_]closed[/]' : '[green]open[/]'}")
        Formatador.display_line(members.map { |m| "[cyan]@#{m}[/]" }.join(', ')) unless members.empty?
        Formatador.display_line("{ #{labels.map { |l| "[purple]#{l}[/]" }.join(', ')} }") unless labels.empty?
        Formatador.display_line("due on [red]#{card.due.getlocal.ctime}[/]") unless card.due.nil?
        unless card.checklists.empty?
          Formatador.display_line("---")
          card.checklists.each do |checklist|
            Formatador.display_line(checklist.name)
            Formatador.indent do
              checklist.check_items.each do |checklist_item|
                checkbox = if checklist_item['state'].match?(/^complete$/)
                             "\u2713".force_encoding('utf-8')
                           else
                             ' '
                           end
                Formatador.display_line("[#{checkbox}] #{checklist_item['name']}")
              end
            end
          end
        end
        unless card.desc.empty?
          Formatador.display_line("---")
          Formatador.display_line(card.desc) # FIXME: what happens if the desc is multiple lines?
        end
      end
    end
  end
end
