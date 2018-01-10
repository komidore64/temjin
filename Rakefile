require 'rake/clean'
require 'rake/testtask'
require 'rubocop/rake_task'

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = ['test/main.rb']
  t.verbose = true
end

RuboCop::RakeTask.new

desc "Runs Rubocop style checker with xml output for Jenkins"
task 'rubocop:jenkins' do
  system("bundle exec rubocop \
          --require rubocop/formatter/checkstyle_formatter \
          --format Robocop::Formatter::CheckstyleFormatter \
          --no-color \
          --out rubocop.xml")
end

task :default => %i[test rubocop]

CLEAN.include('coverage')
