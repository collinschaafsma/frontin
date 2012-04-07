# -*- encoding: utf-8 -*-
require File.expand_path('../lib/frontin/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Collin Schaafsma"]
  gem.email         = ["collin@quickleft.com"]
  gem.description   = %q{Give your frontend code some respect in Rails! Don't even front.}
  gem.summary       = %q{Frontin adds middleware to allow you to develop your frontend code in Rails/root/frontend. It also provides generators to easily setup the backbone boilerplate using Grunt so that you can easily build to public/ for production.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "frontin"
  gem.require_paths = ["lib"]
  gem.version       = Frontin::VERSION

  gem.add_dependency("railties", "~> 3.1")
end
