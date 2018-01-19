require 'simplecov'
SimpleCov.start do
  add_filter '/test/'
end

require 'minitest/autorun'

require 'temjin'

require 'webmock'
include WebMock::API
WebMock.enable!
WebMock.disable_net_connect!

module Temjin
  module Test
    HOME_DIR = File.dirname(__FILE__)
  end
end

Dir['./test/helpers/*.rb'].each do |h|
  require h
end

# TODO: WRITE TESTS
Dir['./test/**/*_test.rb'].each do |f|
  require f
end
