module Temjin
  module Test
    module ConfigCommand
      class TestShowCommand < MiniTest::Test
        include CaptureOutput

        def setup
          @test_config_path_proper ||= File.join(File.expand_path(Temjin::Test::HOME_DIR), 'files', 'configs', 'proper_config.yml')
          @show_command = Temjin::ConfigCommand::ShowCommand.new('temjin config show')
        end

        def teardown
          @show_command = nil
          Temjin::ConfigCommand.instance_variable_set(:@config_file_path, nil)
        end

        def test_show_with_existing_config_file
          Temjin::ConfigCommand.instance_variable_set(:@config_file_path, @test_config_path_proper)
          test_config = YAML.load_file(@test_config_path_proper)
          command_args = []

          expected = "key: #{test_config['key']}\n" +
            "token: #{test_config['token']}\n"

            actual_stdout, _ = capture_output do
              @show_command.run(command_args)
            end

            assert_equal(expected, actual_stdout)
        end

        def test_show_without_existing_config_file
          Temjin::ConfigCommand.instance_variable_set(:@config_file_path, File.join(File.expand_path(Temjin::Test::HOME_DIR), 'path', 'that', 'does', 'not', 'exist.yml'))
          command_args = []

          expected = "Configuration file not found. Please run `temjin config init`.\n"

          actual_stdout, _ = capture_output do
            @show_command.run(command_args)
          end

          assert_equal(expected, actual_stdout)
        end
      end
    end
  end
end
