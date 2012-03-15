module RngWebsite
  module Generators
    class UploaderGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      argument :uploader_name, :type => :string, :default => "image"
      class_option :image, :type => :boolean, :default => true, :desc => ""

      def generate_uploader
        template "carrierwave/uploader.rb.erb", "app/uploaders/#{uploader_name}_uploader.rb"
      end
    end
  end
end
