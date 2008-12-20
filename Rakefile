require 'rubygems'
require 'rake/gempackagetask'
require 'rake/testtask'

require 'lib/rush_deploy/version'

task :default => :test

spec = Gem::Specification.new do |s|
  s.name             = 'rush_deploy'
  s.version          = RushDeploy::Version.to_s
  s.has_rdoc         = false
#  s.extra_rdoc_files = %w(README.markdown)
  s.summary          = ""
  s.author           = 'François Wurmus'
  s.email            = 'fronx@wurmus.de'
  s.homepage         = 'http://fronx.wurmus.de'
  s.files            = %w(README Rakefile) + Dir.glob("{lib,test}/**/*")
  # s.executables    = ['rush_deploy']
  
  s.add_dependency('rush', '>=0.4')
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList["test/**/*_test.rb"]
  t.verbose = true
end

desc 'Generate the gemspec to serve this Gem from Github'
task :github do
  file = File.dirname(__FILE__) + "/#{spec.name}.gemspec"
  File.open(file, 'w') {|f| f << spec.to_ruby }
  puts "Created gemspec: #{file}"
end