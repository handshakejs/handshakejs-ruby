# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'handshakejs/version'

Gem::Specification.new do |gem|
  gem.name          = "handshakejs"
  gem.version       = Handshakejs::VERSION
  gem.authors       = ["scottmotte"]
  gem.email         = ["scott@scottmotte.com"]
  gem.description   = %q{Rubygem for Handshakejs session check.}
  gem.summary       = %q{Rubygem for Handshakejs session check.}
  gem.homepage      = "http://github.com/scottmotte/handshakejs-ruby"

  gem.add_dependency "armor", "0.0.3"
  
  gem.add_development_dependency "foreman"
  gem.add_development_dependency "pry"
  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
