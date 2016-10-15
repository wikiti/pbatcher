# Generated by juwelier
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Juwelier::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: pbatcher 0.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "pbatcher"
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Daniel Herzog"]
  s.date = "2016-10-15"
  s.description = "Process Batcher (or `pbatcher`) is a ruby gem used to build quick CLI apps to process batches of tasks."
  s.email = "info@danielherzog.es"
  s.extra_rdoc_files = [
    "LICENSE.md",
    "README.md"
  ]
  s.files = [
    ".document",
    "CONTRIBUTING.md",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.md",
    "README.md",
    "Rakefile",
    "VERSION",
    "lib/pbatcher.rb",
    "lib/pbatcher/generator.rb",
    "lib/pbatcher/handler.rb",
    "lib/pbatcher/iterator.rb",
    "lib/pbatcher/namer.rb",
    "lib/pbatcher/printer.rb",
    "lib/pbatcher/proc_handler.rb",
    "lib/pbatcher/processor.rb",
    "lib/pbatcher/validator.rb",
    "test/helper.rb",
    "test/test_generator.rb",
    "test/test_iterator.rb",
    "test/test_logger.rb",
    "test/test_namer.rb",
    "test/test_pbatcher.rb",
    "test/test_printer.rb",
    "test/test_processor.rb",
    "test/test_validator.rb"
  ]
  s.homepage = "http://github.com/wikiti/pbatcher"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.5.1"
  s.summary = "A simple library to create CLI batch applications."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<colorize>, [">= 0"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
      s.add_development_dependency(%q<juwelier>, ["~> 2.1.0"])
      s.add_development_dependency(%q<pry>, ["~> 0.10.0"])
      s.add_development_dependency(%q<pry-nav>, ["~> 0.2.0"])
    else
      s.add_dependency(%q<colorize>, [">= 0"])
      s.add_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<juwelier>, ["~> 2.1.0"])
      s.add_dependency(%q<pry>, ["~> 0.10.0"])
      s.add_dependency(%q<pry-nav>, ["~> 0.2.0"])
    end
  else
    s.add_dependency(%q<colorize>, [">= 0"])
    s.add_dependency(%q<rdoc>, ["~> 3.12"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<juwelier>, ["~> 2.1.0"])
    s.add_dependency(%q<pry>, ["~> 0.10.0"])
    s.add_dependency(%q<pry-nav>, ["~> 0.2.0"])
  end
end
