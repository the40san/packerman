# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'packerman/version'

Gem::Specification.new do |spec|
  spec.name          = "packerman"
  spec.version       = Packerman::VERSION
  spec.authors       = ["Masashi AKISUE"]
  spec.email         = ["masashi.akisue@aktsk.jp"]

  spec.summary       = %q{Ruby DSL for Packer(www.packer.io)}
  spec.homepage      = "https://github.com/the40san/packerman"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = ["packerman"]
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport"
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
