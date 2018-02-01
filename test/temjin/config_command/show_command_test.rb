module Temjin
  module Test
    module ConfigCommand
      class ShowCommandTest < MiniTest::Test
        include CaptureOutput

        def setup
          @config ||= YAML.load_file(File.join(File.expand_path(Temjin::Test::HOME_DIR), 'files', 'configs', 'proper_config.yml'))
          @key = @config['key']
          @token = @config['token']
        end

        def test_run
          config = mock()
          config.expects(:key).returns(@key)
          config.expects(:token).returns(@token)

          @show_command = Temjin::ConfigCommand::ShowCommand.new('temjin config show', :config => config)

          expected_stdout = "key: #{@key}\ntoken: #{@token}\n"

          actual_stdout, _ = capture_output do
            @show_command.run([])
          end

          assert_equal(expected_stdout, actual_stdout)
        end
      end
    end
  end
end
