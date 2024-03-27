# -*- encoding: utf-8 -*-
# frozen_string_literal: true

$:.push File.expand_path("../lib", __FILE__)
require "git-version/version"

Gem::Specification.new do |s|
  s.name        = "git-version"
  s.version     = GitVersion::VERSION.dup
  s.platform    = Gem::Platform::RUBY
  s.licenses    = ["MIT"]
  s.authors     = ["Darrin Holst", "David Lowenfels"]
  s.email       = ["david.lowenfels@gmail.com"]
  s.homepage    = "https://github.com/dfl/git-version"
  s.summary     = %q{Add current git commit as a rails endpoint}
  s.description = %q{Add current git commit hash as a rails endpoint bound to /version}

  # s.rubyforge_project = "git-version"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.required_ruby_version = '>= 2.7.0'
  s.add_dependency "rails", "~> 7.0" # or whatever version you target
end
