$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'nikeplusgem/version'

Gem::Specification.new do |g|
  g.name          = "nikeplusgem"
  g.version       = NikePlusGem::VERSION
  g.platform      = Gem::Platform::RUBY
  g.license       = "MIT"
  g.summary       = "Nike+ Gem"
  g.description   = "A client library to retrieve data from the Nike+ Developer Resources API."
  g.authors       = ["Rob Shaw"]
  g.email         = ["rob@borwahs.com"]
  g.homepage      = "https://github.com/borwahs/nikeplusgem/"

  g.files         = Dir["./**/*"].reject{|file| file =~ /\.\/(doc|pkg|spec|test)/}
  g.require_paths = ["lib"]

  g.test_files    = Dir["./spec/**/*"]

  # Dependencies
  g.add_development_dependency "rspec"
  g.add_development_dependency "rake"
  g.add_development_dependency "vcr"
  g.add_development_dependency "yard"
  g.add_development_dependency "webmock", ">= 1.8.0", "< 1.16.0"

  g.add_runtime_dependency "httparty"
end
