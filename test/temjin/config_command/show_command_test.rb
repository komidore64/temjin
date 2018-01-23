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

        def test_show_with_existing_config_file
          config = MiniTest::Mock.new
          config.expect(:key, @key, [])
          config.expect(:token, @token, [])

          @show_command = Temjin::ConfigCommand::ShowCommand.new('temjin config show', :config => config)

          expected = "key: #{@key}\ntoken: #{@token}\n"

          actual_stdout, _ = capture_output do
            @show_command.run([])
          end

          assert_equal(expected, actual_stdout)
        end
      end
    end
  end
end
