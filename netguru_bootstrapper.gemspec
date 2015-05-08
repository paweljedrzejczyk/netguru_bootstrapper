# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'netguru_bootstrapper/version'

Gem::Specification.new do |spec|
  spec.name          = "netguru_bootstrapper"
  spec.version       = NetguruBootstrapper::VERSION
  spec.authors       = ["Mateusz Czajka"]
  spec.email         = ["mat.czajka@gmail.com"]
  spec.summary       = 'Twitter Bootstrap generator for Rails'
  spec.homepage      = 'https://github.com/netguru/netguru_bootstrapper'
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_dependency "thor"
end
