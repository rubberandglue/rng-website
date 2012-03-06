$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rng-website/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rng-website"
  s.version     = RngWebsite::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of RngWebsite."
  s.description = "TODO: Description of RngWebsite."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.0"
  s.add_dependency 'bootstrap-sass', '~> 2.0.1'
  s.add_dependency "simple_form", "> 2.0.0"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'coffee-rails'

  # tests
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "guard-spork"
end
