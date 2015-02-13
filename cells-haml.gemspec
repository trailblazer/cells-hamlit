# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'cells-haml'
  spec.version       = '0.0.1'
  spec.authors       = ['Abdelkader Boudih', 'Nick Sutterer']
  spec.email         = %w(terminale@gmail.com apotonick@gmail.com)
  spec.summary       = 'Haml integration for Cells'
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/trailblazer/cells-haml'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = spec.files.grep(%r{^(test)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'cells', '~> 4.0.0.beta'
  spec.add_runtime_dependency 'haml', '~> 4.0'
  spec.add_development_dependency 'bundler', '>= 1.6'
  spec.add_development_dependency 'rake', '~> 10.0'
end
