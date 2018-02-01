module Temjin
  module Test
    module CardCommand
      class ShowCommandTest < MiniTest::Test
        include CaptureOutput

        def setup
          @username = 'solid_snake'
          @key = '0123456789abcdef0123456789abcdef'
          @token = '0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef'

          @board_name = 'fake_board'
          @list_name = 'fake_list'
          @label = 'fake_label'
          @id = '0123456789abcdef0123456789abcdef'
          @card_name = "remind everyone that i'm no hero"
          @card_desc = "uttered it a million times in metal gear solid 4"
        end

        def teardown; end

        def test_run
          config = mock('config')
          config.expects(:key).returns(@key)
          config.expects(:token).returns(@token)

          label = mock('label')
          label.expects(:name).times(2).returns(@label)

          card = mock('card')
          card.expects(:list_id).returns(@id)
          card.expects(:board_id).returns(@id)
          card.expects(:member_ids).returns([@id, @id])
          card.expects(:labels).returns([label, label])
          card.expects(:name).returns(@card_name)
          card.expects(:id).returns(@id)
          card.expects(:short_url).returns('http://trello.com/fancyshorturl')
          card.expects(:attachments).returns([])
          card.expects(:closed?).returns(false)
          card.expects(:due).times(2).returns(Time.now + (60 * 60 * 24))
          card.expects(:checklists).returns([])
          card.expects(:desc).times(2).returns(@card_desc)

          user = mock('user')
          user.expects(:username).times(2).returns(@username)

          list = mock('list')
          list.expects(:name).returns(@list_name)

          board = mock('board')
          board.expects(:name).returns(@board_name)

          show_command = Temjin::CardCommand::ShowCommand.new('temjin card show', :config => config)
          show_command.expects(:find_card).with(@id).returns(card)
          show_command.expects(:find_list_by_id).with(@id).returns(list)
          show_command.expects(:find_user).with(@id).times(2).returns(user)
          show_command.expects(:find_board).with(@id).returns(board)

          capture_output do
            show_command.run([@id])
          end
        end
      end
    end
  end
end
