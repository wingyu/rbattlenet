# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rbattlenet/version'

Gem::Specification.new do |spec|
  spec.name          = "rbattlenet"
  spec.version       = RBattlenet::VERSION
  spec.authors       = ["Vincent Wong", "Ryan Fox"]
  spec.email         = ["wingyu64@gmail.com", "rfox75@gmail.com"]
  spec.summary       = %q{A wrapper for the Blizzard's Battle.net API}
  spec.description   = %q{My attempt at creating a Ruby wrapper for the Blizzard's Battle.net Community Platform API.}
  spec.homepage      = "https://github.com/ausomator/rbattlenet"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '~> 2.2'
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'vcr', '~> 2.9.3'
  spec.add_development_dependency "webmock"

  spec.add_runtime_dependency "typhoeus", "~> 1.1"
  spec.add_runtime_dependency 'httparty', '~> 0.16.1'
end
