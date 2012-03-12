$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rng-website/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rng-website"
  s.version     = RngWebsite::VERSION
  s.authors     = ["Christian Finck"]
  s.email       = ["christian@rubberandglue.at"]
  s.homepage    = "https://github.com/finchi/rng-website"
  s.summary     = "gem for our websites @ rubber & glue"
  s.description = "gem for our websites @ rubber & glue"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 3.2.0"
  s.add_dependency 'bootstrap-sass', '~> 2.0.1'
  s.add_dependency "simple_form", "> 2.0.0"
  s.add_dependency "sorcery", "~> 0.7.6"
  s.add_dependency "simple-navigation", '~> 3.7.0'

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'coffee-rails'

  # tests
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "guard-spork"
  s.add_development_dependency "factory_girl_rails"
end
