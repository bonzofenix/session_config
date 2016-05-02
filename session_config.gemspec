# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'session_config/version'

Gem::Specification.new do |spec|
  spec.name          = "session_config"
  spec.version       = SessionConfig::VERSION
  spec.authors       = ["Alan Moran"]
  spec.email         = ["bonzofenix@gmail.com"]

  spec.summary       = %q{ Lets you store and consume configurations from a hidden file in your home directory.  }
  spec.homepage      = "https://github.com/bonzofenix/session_config"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
