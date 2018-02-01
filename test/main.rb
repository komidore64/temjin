require 'mocha/mini_test'

require 'simplecov'
SimpleCov.start do
  add_filter '/test/'
end

require 'minitest/autorun'
require 'mocha/setup'

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

require './test/helpers/capture_output.rb'

Dir['./test/**/*_test.rb'].each do |f|
  require f
end
