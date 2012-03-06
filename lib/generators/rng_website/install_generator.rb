module RngWebsite
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      def copy_scaffold_template
        copy_file 'scaffold/_form.html.erb', 'lib/templates/erb/scaffold/_form.html.erb'
      end

      def copy_bootstrap_css
        copy_file 'bootstrap.css.sass', 'app/assets/stylesheets/bootstrap_import_and_overwrite.css.sass'
      end
    end
  end
end
