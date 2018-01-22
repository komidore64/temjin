module Temjin
  module Test
    module ConfigCommand
      class TestInitCommand < MiniTest::Test
        include CaptureOutput

        def setup
          @tempfile = Tempfile.new('config.yml')
          @test_config_path = @tempfile.path
          @init_command = Temjin::ConfigCommand::InitCommand.new('')
        end

        def teardown
          @init_command = nil
          Temjin::ConfigCommand.instance_variable_set(:@config_file_path, nil)
          @tempfile.close!
        end

        def test_execute
          Temjin::ConfigCommand.instance_variable_set(:@config_file_path, @test_config_path)

          expected_config_file_contents = {
            'username' => 'solid_snake',
            'key' => '0123456789abcdef0123456789abcdef',
            'token' => '0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef'
          }

          capture_output do |stdin|
            stdin.puts('solid_snake')
            stdin.puts('0123456789abcdef0123456789abcdef')
            stdin.puts('0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef')
            stdin.rewind
            @init_command.execute
          end

          assert_equal(expected_config_file_contents, YAML.load_file(@test_config_path))
        end
      end
    end
  end
end
