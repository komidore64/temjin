module Temjin
  class Command < Clamp::Command
    def initialize(invocation_path, context = {})
      @config = context[:config] if context.key?(:config)
      super(invocation_path, context)
    end

    def config
      @config ||= Config.new
    end
  end

  class TrelloAPICommand < Temjin::Command
    def initialize(invocation_path, context = {})
      super(invocation_path, context)
      trello_connection
    end

    def trello_connection
      Trello.configure do |c|
        c.developer_public_key = config.key
        c.member_token = config.token
      end
    end

    def find_board(board_id)
      Trello::Board.find(board_id)
    end

    def find_list(user, board_name, list_name)
      user.boards.detect { |b| b.name.match(board_name) }.lists.detect { |l| l.name.match(list_name) }
    end

    def find_list_by_id(list_id)
      Trello::List.find(list_id)
    end

    def find_user(username)
      Trello::Member.find(username)
    end

    def find_card(card_id)
      Trello::Card.find(card_id)
    end
  end
end
