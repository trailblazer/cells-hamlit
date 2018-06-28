lib = File.expand_path("../lib/", __FILE__)
$:.unshift lib unless $:.include?(lib)

require "cell/hamlit/version"

Gem::Specification.new do |spec|
  spec.name          = "cells-hamlit"
  spec.version       = Cell::Hamlit::VERSION
  spec.authors       = ["Nick Sutterer", "Timo Schilling"]
  spec.email         = %w(apotonick@gmail.com timo@schilling.io)
  spec.summary       = "Hamlit integration for Cells"
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/trailblazer/cells-hamlit"
  spec.license       = "LGPL-3.0"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = spec.files.grep(%r{^(test)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "cells", "~> 4.0"
  spec.add_dependency "hamlit"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
end
