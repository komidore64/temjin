$LOAD_PATH.unshift(File.expand_path('../lib', __FILE__))

require 'yaml'
require 'temjin/version'

Gem::Specification.new do |gem|
  gem.name                  = 'temjin'
  gem.version               = Temjin.version
  gem.license               = 'GPL-3.0'
  gem.description           = 'Temjin provides a command interface to Trello.'
  gem.summary               = gem.description
  gem.homepage              = 'https://github.com/komidore64/temjin'
  gem.authors               = YAML.load_file('authors.yml')
  gem.email                 = ['komidore64@gmail.com']

  gem.files                 = Dir['lib/**/*', 'bin/*', 'test/**/*', 'README.md', 'LICENSE', 'Rakefile', 'authors.yml'].sort
  gem.test_files            = Dir['test/**/*']
  gem.require_paths         = ['lib']
  gem.bindir                = 'bin'
  gem.executables          << 'temjin'

  gem.required_ruby_version = '>= 2.4'
  gem.add_dependency 'clamp', '1.2.0.beta1'
  gem.add_dependency 'formatador', '~> 0.2.5'
  gem.add_dependency 'ruby-trello', '~> 2.0.0'

  gem.add_development_dependency 'minitest', '~> 5.11.3'
  gem.add_development_dependency 'mocha', '~> 1.3.0'
  gem.add_development_dependency 'rake', '~> 12.3.0'
  gem.add_development_dependency 'rake-notes', '~> 0.2.0'
  gem.add_development_dependency 'rubocop', '0.52.1'
  gem.add_development_dependency 'rubocop-checkstyle_formatter', '0.4.0'
  gem.add_development_dependency 'simplecov', '~> 0.15.1'
  gem.add_development_dependency 'webmock', '~> 3.3.0'
  gem.add_development_dependency 'awesome_print', '~> 1.8.0'
  gem.add_development_dependency 'pry'
  gem.add_development_dependency 'pry-byebug'
  gem.add_development_dependency 'pry-stack_explorer'
end
