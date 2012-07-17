# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "middleman-favicon-maker/version"

Gem::Specification.new do |s|
  s.name        = "middleman-favicon-maker"
  s.version     = Middleman::FaviconMaker::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Andreas Follmann", "Kematzy"]
  #s.email       = [""]
  s.homepage    = "https://github.com/follmann/middleman-favicon-maker"
  s.summary     = %q{Generate favicon files in various sizes from a base image in your Middleman project}
  s.description = %q{Generate favicon files in various sizes from a base image in your Middleman project}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  # Additional dependencies
  s.add_runtime_dependency("middleman-core", [">= 3.0.0"])
  s.add_runtime_dependency("favicon_maker", ["~>0.0.7"])
end
