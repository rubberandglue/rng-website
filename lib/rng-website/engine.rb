require "rubygems"
require "simple_form"
require "sorcery"

module RngWebsite
  class Engine < ::Rails::Engine
    config.generators do |g|
      g.test_framework :rspec, :view_specs => false
    end
  end
end
