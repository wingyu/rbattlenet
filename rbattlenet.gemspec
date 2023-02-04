# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rbattlenet/version'

Gem::Specification.new do |spec|
  spec.name          = "rbattlenet"
  spec.version       = RBattlenet::VERSION
  spec.authors       = ["Vincent Wong", "Ryan Fox", "Emiel van Lankveld"]
  spec.email         = ["wingyu64@gmail.com", "rfox75@gmail.com", "emiel@vanlankveld.me"]
  spec.summary       = %q{Access Blizzard's APIs with Ruby.}
  spec.description   = %q{A Ruby wrapper around Blizzard's Game Data and Profile APIs.}
  spec.homepage      = "https://github.com/wingyu/rbattlenet"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'vcr', '~> 2.9.3'
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "byebug"

  spec.add_runtime_dependency "typhoeus", "~> 1.1"
  spec.add_runtime_dependency "addressable"
  spec.add_runtime_dependency "oj"
  spec.add_runtime_dependency "require_all" # convenience
end
