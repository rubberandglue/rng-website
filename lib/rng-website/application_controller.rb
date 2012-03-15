module RngWebsite
  module ApplicationController
    def self.included(base)
      base.class_eval do
        base.rescue_from ActiveRecord::RecordNotFound, :with => :redirect_to_base
      end
    end

    def not_authenticated
      redirect_to login_url, :alert => t('rng_website.not_authenticated')
    end

    private

    def redirect_to_base
      redirect_to root_path
    end
  end
end
