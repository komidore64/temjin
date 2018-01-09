$LOAD_PATH.unshift(File.expand_path('../lib', __FILE__))

require 'yaml'
require 'temjin/version'

Gem::Specification.new do |gem|
  gem.name          = 'temjin'
  gem.version       = Temjin.version
  gem.license       = 'GPL3'
  gem.description   = 'Temjin provides a command interface to Trello.'
  gem.summary       = gem.description
  # gem.homepage    = where?
  gem.authors       = YAML.load_file('authors.yml')
  gem.email         = ['komidore64@gmail.com']

  gem.files         = Dir['lib/**/*.rb']
  gem.test_files    = Dir['test/**/*']
  gem.require_paths = ['lib']
  gem.executables << 'temjin'

  gem.add_dependency 'clamp'
  gem.add_dependency 'ruby-trello'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'minitest'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'rubocop', '~> 0.46.0'
  gem.add_development_dependency 'rubocop-checkstyle_formatter'
end