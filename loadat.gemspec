# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "loadat/version"

Gem::Specification.new do |s|
  s.name        = "loadat"
  s.version     = Loadat::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Joon Lee"]
  s.email       = ["seouri@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Ruby on Rails Rake task for loading data in text files into MySQL database.}
  s.description = %q{load_dat is a Ruby on Rails Rake task that loads data in <tablename>.dat into MySQL database that is defined in the database.yml file.}

  s.rubyforge_project = "loadat"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
