# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'faraday_middleware/request/user_agent_faker'

Gem::Specification.new do |spec|
  spec.name          = "faraday-uafaker"
  spec.version       = FaradayMiddleware::UserAgentFaker::VERSION
  spec.authors       = ["Shem Ming"]
  spec.email         = ["shemusok@gmail.com"]
  spec.summary       = %q{Faraday middleware for faking UA string.}
  spec.description   = %q{Lorem ipsum.}
  spec.homepage      = "https://github.com/shemusok/faraday-uafaker"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'nokogiri', '~> 1.6', '>= 1.6.3'
  spec.add_dependency "faraday", "~> 0.9"
end
