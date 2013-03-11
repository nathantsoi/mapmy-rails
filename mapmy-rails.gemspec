# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mapmy/rails/version'

Gem::Specification.new do |gem|
  gem.name          = "mapmy-rails"
  gem.version       = Mapmy::Rails::VERSION
  gem.authors       = ["Nathan"]
  gem.email         = ["nathan@vertile.com"]
  gem.description   = "Easy http://openlayers.org/ maps in rails."
  gem.summary       = "Build open maps in rails without breakin' a sweat."
  gem.homepage      = "https://github.com/nathantsoi/mapmy-rails"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
