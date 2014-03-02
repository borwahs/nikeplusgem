require File.expand_path("../lib/nikeplusgem/version", __FILE__)

Gem::Specification.new do |g|
  g.name          = "nikeplusgem"
  g.version       = NikePlusGem::VERSION
  g.date          = "2013-12-28"
  g.license       = "MIT"
  g.summary       = "Nike+ Gem"
  g.description   = "A client library to retrieve data from the Nike+ Developer Resources API."
  g.authors       = ["Rob Shaw"]
  g.email         = ["rob@borwahs.com"]
  g.homepage      = "https://github.com/borwahs/nikeplusgem/"

  g.files         = Dir["./**/*"].reject{|file| file =~ /\.\/(doc|pkg|spec|test)/}
  g.require_paths << "lib"
end
