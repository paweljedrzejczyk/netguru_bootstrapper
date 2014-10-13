require 'rails/generators'

module NetguruBootstrapper
  module Generators
    class BootstrapGenerator < ::Rails::Generators::Base
      desc 'Bootstrap CSS generator'
      source_root File.expand_path('../../templates', __FILE__)

      def create_directories
        %w( components controllers settings settings/bootstrap-overrides
            utilities ).each do |dir|
          empty_directory "app/assets/stylesheets/#{dir}"
          create_file "app/assets/stylesheets/#{dir}/.gitkeep"
        end
      end

      def create_application_file
        template 'application.scss', "#{base_path}/application.scss"
      end

      def create_utilities_files
        %w( functions mixins shared typography ).each do |file|
          template "utilities/#{file}.scss", "#{base_path}/utilities/#{file}.scss"
        end
      end

      def create_settings_files
        %w( custom-variables z-index-variables ).each do |file|
          template "settings/#{file}.scss", "#{base_path}/settings/#{file}.scss"
        end
      end

      private

      def base_path
        'app/assets/stylesheets'
      end
    end
  end
end
