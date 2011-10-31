# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "version"

Gem::Specification.new do |s|
  s.name        = "middleman-favicon-maker"
  s.version     = Middleman::FaviconMaker::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Andreas Follmann"]
  #s.email       = [""]
  s.homepage    = "https://github.com/follmann/middleman-favicon-maker"
  s.summary     = %q{Generate favicon files in various sizes from a base image in your middleman project}
  s.description = %q{Generate favicon files in various sizes from a base image in your middleman project}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_runtime_dependency("favicon_creator", ["~> 0.0.1"])
end