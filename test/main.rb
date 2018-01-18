require 'simplecov'
SimpleCov.start do
  add_filter '/test/'
end

require 'webmock/minitest'
WebMock.disable_net_connect!

require 'minitest/autorun'

require 'temjin'

# TODO: WRITE TESTS
Dir['./test/**/*_test.rb'].each do |f|
  require f
end
