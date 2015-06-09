lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'cell/haml/version'

Gem::Specification.new do |spec|
  spec.name          = 'cells-haml'
  spec.version       = Cell::Haml::VERSION
  spec.authors       = ['Abdelkader Boudih', 'Nick Sutterer']
  spec.email         = %w(terminale@gmail.com apotonick@gmail.com)
  spec.summary       = 'Haml integration for Cells'
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/trailblazer/cells-haml'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = spec.files.grep(%r{^(test)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'cells', '~> 4.0.0.beta6'
  spec.add_dependency 'haml', '>= 4.1.0.beta.1'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
end
