module Temjin
  module Test
    module CardCommand
      class UpdateCommandTest < MiniTest::Test
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

        def test_run_no_options
          config = mock('config')
          config.expects(:key).returns(@key)
          config.expects(:token).returns(@token)

          card = mock('card')
          card.expects(:save)
          card.expects(:id).returns(@id)

          update_command = Temjin::CardCommand::UpdateCommand.new('temjin card update', :config => config)
          update_command.expects(:find_card).with(@id).returns(card)

          capture_output do
            update_command.run([@id])
          end
        end

        def test_run_with_name
          config = mock('config')
          config.expects(:key).returns(@key)
          config.expects(:token).returns(@token)

          card = mock('card')
          card.expects(:name=).with(@card_name)
          card.expects(:save)
          card.expects(:id).returns(@id)

          update_command = Temjin::CardCommand::UpdateCommand.new('temjin card update', :config => config)
          update_command.expects(:find_card).with(@id).returns(card)

          capture_output do
            update_command.run([@id, '--name', @card_name])
          end
        end

        def test_run_with_desc
          config = mock('config')
          config.expects(:key).returns(@key)
          config.expects(:token).returns(@token)

          card = mock('card')
          card.expects(:desc=).with(@card_desc)
          card.expects(:save)
          card.expects(:id).returns(@id)

          update_command = Temjin::CardCommand::UpdateCommand.new('temjin card update', :config => config)
          update_command.expects(:find_card).with(@id).returns(card)

          capture_output do
            update_command.run([@id, '--desc', @card_desc])
          end
        end
      end
    end
  end
end
