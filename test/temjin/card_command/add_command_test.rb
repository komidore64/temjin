module Temjin
  module Test
    module CardCommand
      class AddCommandTest < MiniTest::Test
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

        def test_execute_no_options
          config = mock()
          config.expects(:username).returns(@username)
          config.expects(:key).returns(@key)
          config.expects(:token).returns(@token)

          list = mock()
          list.expects(:id).returns(@id)

          add_command = Temjin::CardCommand::AddCommand.new('temjin card add', :config => config)
          add_command.expects(:find_user).with(@username).returns(@username)
          add_command.expects(:find_list).with(@username, @board_name, @list_name).returns(list)

          added_card = mock()
          added_card.expects(:id).returns(@id)

          create_options = {:list_id => @id}

          Trello::Card.expects(:create).with(create_options).returns(added_card)

          capture_output do
            add_command.run([@board_name, @list_name])
          end
        end

        def test_execute_with_name
          config = mock()
          config.expects(:username).returns(@username)
          config.expects(:key).returns(@key)
          config.expects(:token).returns(@token)

          list = mock()
          list.expects(:id).returns(@id)

          add_command = Temjin::CardCommand::AddCommand.new('temjin card add', :config => config)
          add_command.expects(:find_user).with(@username).returns(@username)
          add_command.expects(:find_list).with(@username, @board_name, @list_name).returns(list)

          added_card = mock()
          added_card.expects(:id).returns(@id)

          create_options = {:list_id => @id, :name => @card_name}

          Trello::Card.expects(:create).with(create_options).returns(added_card)

          capture_output do
            add_command.run([@board_name, @list_name, @card_name])
          end
        end

        def test_execute_with_name_and_desc
          config = mock()
          config.expects(:username).returns(@username)
          config.expects(:key).returns(@key)
          config.expects(:token).returns(@token)

          list = mock()
          list.expects(:id).returns(@id)

          add_command = Temjin::CardCommand::AddCommand.new('temjin card add', :config => config)
          add_command.expects(:find_user).with(@username).returns(@username)
          add_command.expects(:find_list).with(@username, @board_name, @list_name).returns(list)

          added_card = mock()
          added_card.expects(:id).returns(@id)

          create_options = {:list_id => @id, :name => @card_name, :desc => @card_desc}

          Trello::Card.expects(:create).with(create_options).returns(added_card)

          capture_output do
            add_command.run([@board_name, @list_name, @card_name, '--desc', @card_desc])
          end
        end
      end
    end
  end
end
