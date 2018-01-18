require 'simplecov'
SimpleCov.start do
  add_filter '/test/'
end

require 'webmock/minitest'
require 'minitest/autorun'

require 'temjin'

# TODO: WRITE TESTS
Dir['./test/**/*_test.rb'].each do |f|
  require f
end
