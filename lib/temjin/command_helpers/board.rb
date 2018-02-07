module Temjin
  module CommandHelpers
    module Board
      def self.switches
        ['-b', '--board']
      end

      def self.argument
        'BOARD'
      end

      def self.description
        'trello board'
      end

      def self.opt_declarations
        [switches, argument, description]
      end

      module ClassMethods
        def board_option
          option(*Board.opt_declarations)
        end

        def board_option_with_default
          board_option

          define_method(:default_board) do
            config.default_board
          end
        end
      end

      def self.included(base)
        base.extend(ClassMethods)
      end
    end
  end
end
