require 'rake'
require 'rake/clean'
require 'rspec/core/rake_task'
require 'yard'

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

# testing
desc "run rspec tests"
RSpec::Core::RakeTask.new(:spec)

task :test => :spec

desc "Create documentation"
YARD::Rake::YardocTask.new do |t|
  t.files   = ['lib/**/*.rb']
end