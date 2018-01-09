require 'simplecov'
SimpleCov.start do
  add_filter '/test/'
end

require 'minitest/autorun'

require 'temjin'

Dir['./test/**/*_test.rb'].each do |f|
  require f
end
