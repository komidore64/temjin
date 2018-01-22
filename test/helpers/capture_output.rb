module Temjin
  module Test
    module CaptureOutput
      def capture_output
        original_stdout = $stdout
        $stdout = fake_stdout = StringIO.new

        original_stderr = $stderr
        $stderr = fake_stderr = StringIO.new

        original_stdin = $stdin
        $stdin = fake_stdin = StringIO.new

        begin
          yield(fake_stdin)
        ensure
          $stdout = original_stdout
          $stderr = original_stderr
          $stdin = original_stdin
        end

        [fake_stdout.string, fake_stderr.string]
      end
    end
  end
end
