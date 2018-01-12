source 'https://rubygems.org'

ruby '>= 2.4'

gemspec

['Gemfile.local.rb', 'Gemfile.local'].map do |gf|
  gf = File.join(File.dirname(__FILE__), gf)
  self.instance_eval(Bundler.read_file(gf)) if File.exist?(gf)
end
