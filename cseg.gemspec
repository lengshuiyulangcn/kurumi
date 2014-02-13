# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cseg/version'

Gem::Specification.new do |gem|
  gem.name          = "cseg"
  gem.version       = Cseg::VERSION
  gem.authors       = ["gyorou"]
  gem.email         = ["gyorou@tjjtds.com"]
  gem.description   = %q{"a chinese segmentation tool using CRF"}
  gem.summary       = %q{""}
  gem.homepage      = ""

  gem.files         = [".gitignore",
						"LICENSE.txt",
						"README.md",
						"Gemfile",
						"data/pkumodle.data",
						"lib/cseg/version.rb",
						"lib/cseg.rb",
						"cseg.gemspec",
						"Rakefile",
						]
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib","data"]
end
