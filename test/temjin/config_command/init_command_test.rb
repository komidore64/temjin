module Temjin
  module Test
    module ConfigCommand
      class TestInitCommand < MiniTest::Test
        include CaptureOutput

        def setup
          @tempfile = Tempfile.new('config.yml')
          @test_config_path = @tempfile.path
          @init_command = Temjin::ConfigCommand::InitCommand.new('temjin config init')
        end

        def teardown
          @init_command = nil
          Temjin::ConfigCommand.instance_variable_set(:@config_file_path, nil)
          @tempfile.close!
        end

        def test_run
          Temjin::ConfigCommand.instance_variable_set(:@config_file_path, @test_config_path)
          command_args = []

          expected = {
            'username' => 'solid_snake',
            'key' => '0123456789abcdef0123456789abcdef',
            'token' => '0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef'
          }

          capture_output do |stdin|
            stdin.puts(expected['username'])
            stdin.puts(expected['key'])
            stdin.puts(expected['token'])
            stdin.rewind
            @init_command.run(command_args)
          end

          assert_equal(expected, YAML.load_file(@test_config_path))
        end
      end
    end
  end
end
