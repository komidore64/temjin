module Temjin
  module CommandHelpers
    module List
      def self.switches
        ['-l', '--list']
      end

      def self.argument
        'LIST'
      end

      def self.description
        'trello list'
      end

      def self.opt_declaration
        [switches, argument, description]
      end

      def self.param_declaration
        [argument, description]
      end

      module ClassMethods
        def list_option
          board_option_with_default # from board command helper

          option(*List.opt_declaration) do |list_name|
            if board.nil?
              message = Clamp.message(:option_required_by,
                                      :option => Board.switches.first,
                                      :by => List.switches.first)
              signal_usage_error(message)
            end
            list_name
          end
        end

        def list_parameter
          board_option_with_default # from board command helper

          parameter(*List.param_declaration) do |list_name|
            if board.nil?
              message = Clamp.message(:option_required_by,
                                      :option => Board.switches.first,
                                      :by => "'LIST' parameter because there is no default_board set")
              signal_usage_error(message)
            end
            list_name
          end
        end
      end

      def self.included(base)
        base.extend(ClassMethods)
      end
    end
  end
end
