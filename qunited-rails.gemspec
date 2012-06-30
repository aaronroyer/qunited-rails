# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "qunited/rails/version"

Gem::Specification.new do |s|
  s.name        = "qunited-rails"
  s.version     = Qunited::Rails::VERSION
  s.authors     = ["Aaron Royer"]
  s.email       = ["aaronroyer@gmail.com"]
  s.homepage    = "https://github.com/aaronroyer/qunited-rails"
  s.summary     = %q{QUnit tests for your Rails build}
  s.description = %q{Run headless JavaScript tests with QUnit/QUnited with your Rails project}

  s.rubyforge_project = "qunited-rails"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "qunited"
end
