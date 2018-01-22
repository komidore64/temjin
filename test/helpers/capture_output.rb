module Temjin
  module Test
    module CaptureStdout
      def capture_stdout
        original_stdout = $stdout
        $stdout = fake = StringIO.new
        begin
          yield
        ensure
          $stdout = original_stdout
        end
        fake.string
      end
    end
  end
end
