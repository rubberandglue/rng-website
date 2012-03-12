require "rubygems"
require "simple_form"
require "sorcery"
require "bootstrap-sass"

module RngWebsite
  autoload :ApplicationController, 'rng-website/application_controller'
  class Engine < ::Rails::Engine
    config.generators do |g|
      g.test_framework :rspec, :view_specs => false
    end
  end
end
