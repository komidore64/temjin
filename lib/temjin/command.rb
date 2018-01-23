module Temjin
  class Command < Clamp::Command
    def initialize(invocation_path, context = {})
      @config = context[:config] if context.has_key?(:config)
      super(invocation_path, context)
    end

    def trello_connection
      Trello.configure do |c|
        c.developer_public_key = config.key
        c.member_token = config.token
      end
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
  end
end
