require 'rake'
require 'rake/clean'
require 'rake/testtask'

# values to reuse
NAME = 'nikeplusgem'
VERSION = lambda do
  require File.expand_path("../lib/nikeplusgem", __FILE__)
  NikePlusGem::VERSION
end

# set default task to install and build the gem
task :default => :install

# tasks to manage gem
desc "Build gem"
task :build do
  sh %{gem build #{NAME}.gemspec}
end

desc "Install gem"
task :install => [:build] do
  sh %{gem install ./#{NAME}-#{VERSION.call}.gem --local}
end

desc "Uninstall gem"
task :uninstall do
  sh %{gem uninstall #{NAME}}
end

# get version
desc "Print current version"
task :version do
  puts VERSION.call
end

desc "Run tests"
Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.test_files = FileList['test/*_test.rb']
  #t.verbose = true
end