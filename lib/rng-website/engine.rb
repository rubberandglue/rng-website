require "rubygems"
require "simple_form"
require "sorcery"
require "bootstrap-sass"
require "simple_navigation"
require "i18n_routing"

module RngWebsite
  require "rng-website/bootstrap_simple_nav.rb" if defined?(::SimpleNavigation)
  require "rng-website/simple_form_image_input.rb"
  autoload :ApplicationController, 'rng-website/application_controller'
  class Engine < ::Rails::Engine
    config.generators do |g|
      g.test_framework :rspec, :view_specs => false
    end
  end
end
