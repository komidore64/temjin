module Temjin
  module Test
    module ConfigCommand
      class InitCommandTest < MiniTest::Test
        include CaptureOutput

        def setup
          @username = 'solid_snake'
          @key = '0123456789abcdef0123456789abcdef'
          @token = '0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef'
        end

        def test_run
          config = MiniTest::Mock.new
          config.expect(:username=, nil, [@username])
          config.expect(:key=, nil, [@key])
          config.expect(:token=, nil, [@token])
          config.expect(:save!, nil, [])

          init_command = Temjin::ConfigCommand::InitCommand.new('temjin config init', :config => config)

          capture_output do |stdin|
            stdin.puts(@username)
            stdin.puts(@key)
            stdin.puts(@token)
            stdin.rewind
            init_command.run([])
          end

          assert(config.verify)
        end
      end
    end
  end
end
