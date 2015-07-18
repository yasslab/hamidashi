# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hamidashi/version'

Gem::Specification.new do |spec|
  spec.name          = "hamidashi"
  spec.version       = Hamidashi::VERSION
  spec.authors       = ["Seiei Miyagi"]
  spec.email         = ["hanachin@gmail.com"]

  spec.summary       = %q{Detect PDF text overflow.}
  spec.homepage      = "https://github.com/yasslab/hamidashi"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "docopt"
  spec.add_dependency "rmagick"
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "cucumber"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "review"
end
