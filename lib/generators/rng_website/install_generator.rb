require 'rails/generators/migration'

module RngWebsite
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration

      source_root File.expand_path('../templates', __FILE__)
      class_option :migrations, :type => :boolean, :default => true, :desc => "Include Migrations"

      def copy_scaffold_template
        copy_file 'scaffold/_form.html.erb', 'lib/templates/erb/scaffold/_form.html.erb'
      end

      def copy_bootstrap_css
        copy_file 'bootstrap.css.sass', 'app/assets/stylesheets/bootstrap_import_and_overwrite.css.sass'
      end

      def copy_sorcery_files
        migration_template "sorcery/rng_sorcery_core.rb", "db/migrate/rng_sorcery_core.rb" if options.migrations?
        copy_file 'sorcery/user.rb', 'app/models/user.rb'
      end

      def copy_admin_navigation_file
        copy_file 'admin_navigation.rb', 'config/admin_navigation.rb'
      end

      # Define the next_migration_number method (necessary for the migration_template method to work)
      def self.next_migration_number(dirname)
        if ActiveRecord::Base.timestamped_migrations
          sleep 1 # make sure each time we get a different timestamp
          Time.new.utc.strftime("%Y%m%d%H%M%S")
        else
          "%.3d" % (current_migration_number(dirname) + 1)
        end
      end
    end
  end
end
