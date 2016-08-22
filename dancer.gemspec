# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "dancer/version"

Gem::Specification.new do |spec|
  spec.name          = "dancer"
  spec.version       = Dancer::VERSION
  spec.authors       = ["Steve Hoeksema"]
  spec.email         = ["steve@kotiri.com"]

  spec.summary       = "Dancer steps in Time"
  spec.description   = "A small library to move forward or backward through Time in predefined steps"
  spec.homepage      = "https://github.com/steveh/dancer"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "pry-byebug"
end
