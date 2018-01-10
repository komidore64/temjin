module Temjin
  class MainCommand < Clamp::Command
    option ['-v', '--version'], :flag, 'display version' do
      puts Temjin.version
      exit
    end
  end
end
