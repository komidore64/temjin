module Temjin
  module Test
    class TestShowCommand < MiniTest::Test
      include CaptureStdout

      def setup
        @test_config_path_proper ||= File.join(File.expand_path(Temjin::Test::HOME_DIR), "files", "configs", "proper_config.yml")

        @show_command = ConfigCommand::ShowCommand.new("")
      end

      def teardown
        @show_command = nil
      end

      def test_show_with_existing_config_file
        ConfigCommand.instance_variable_set(:@config_file_path, @test_config_path_proper)
        test_config = YAML.load_file(@test_config_path_proper)

        expected_output = "key: #{test_config['key']}\n" +
          "token: #{test_config['token']}\n"

        actual_output = capture_stdout do
          @show_command.execute
        end

        assert_equal expected_output, actual_output
      end

      def test_show_without_existing_config_file; end
    end
  end
end
