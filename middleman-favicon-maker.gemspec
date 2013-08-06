# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "middleman-favicon-maker/version"

Gem::Specification.new do |gem|
  gem.name          = "middleman-favicon-maker"
  gem.email         = ["hello@toyrocketscience.com"]
  gem.version       = Middleman::FaviconMaker::VERSION
  gem.platform      = Gem::Platform::RUBY
  gem.authors       = ["Andreas Follmann", "Kematzy"]
  gem.email         = ["andreas@toyrocketscience.com"]
  gem.homepage      = "https://github.com/follmann/middleman-favicon-maker"
  gem.summary       = %q{Generate favicon files in various sizes from a base image in your Middleman project}
  gem.description   = %q{Generate favicon files in various sizes from a base image in your Middleman project}

  gem.files         = `git ls-files`.split($\)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.require_paths = ["lib"]

  # Additional dependencies
  gem.add_runtime_dependency("middleman-core", [">= 3.0.0"])
  gem.add_runtime_dependency("favicon_maker", ["~>0.2.3"])
end