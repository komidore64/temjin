module Temjin
  module Test
    module CardCommand
      class ListCommandTest < MiniTest::Test
        include CaptureOutput

        def setup
          @username = 'solid_snake'
          @key = '0123456789abcdef0123456789abcdef'
          @token = '0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef'

          @board_name = 'fake_board'
          @list_name = 'fake_list'
          @id = '0123456789abcdef0123456789abcdef'
          @card_name = "remind everyone that i'm no hero"
          @card_desc = "uttered it a million times in metal gear solid 4"
        end

        def teardown; end

        def test_run
          config = mock('config')
          config.expects(:username).returns(@username)
          config.expects(:key).returns(@key)
          config.expects(:token).returns(@token)

          card = mock('card')
          card.expects(:id).times(3).returns(@id)
          card.expects(:name).times(3).returns(@card_name)
          card.expects(:desc).times(3).returns(@card_desc)
          card_list = [card, card, card]

          list = mock('list')
          list.expects(:cards).returns(card_list)

          list_command = Temjin::CardCommand::ListCommand.new('temjin card list', :config => config)
          list_command.expects(:find_user).with(@username).returns(@username)
          list_command.expects(:find_list).with(@username, @board_name, @list_name).returns(list)

          capture_output do
            list_command.run([@board_name, @list_name])
          end
        end
      end
    end
  end
end
