require "rubygems"
require "simple_form"
require "sorcery"
require "bootstrap-sass"
require "simple_navigation"
require "i18n_routing"

module RngWebsite
  require "rng-website/bootstrap_simple_nav.rb" if defined?(::SimpleNavigation)
  autoload :ApplicationController, 'rng-website/application_controller'
  autoload :ImageUploader,         'rng-website/image_uploader'
  class Engine < ::Rails::Engine
    config.generators do |g|
      g.test_framework :rspec, :view_specs => false
    end
  end
end
