require 'rails/generators'
require 'netguru_bootstrapper/structure_parser'

module NetguruBootstrapper
  module Generators
    class BootstrapGenerator < ::Rails::Generators::Base
      desc 'Bootstrap CSS generator'
      source_root File.expand_path('../../templates', __FILE__)

      def create_root_file
        template 'application.scss', "#{base_path}/application.scss"
      end

      def create_directories
        structure.directories.each do |dir|
          empty_directory "#{base_path}/#{dir}"
          create_files(dir, structure.files[dir])
        end
      end

      private

      def structure
        StructureParser.new
      end

      def create_files(dir, files)
        return create_file "#{base_path}/#{dir}/.gitkeep" if files.nil?
        files.each { |file| copy_template(dir, file) }
      end

      def copy_template(dir, file)
        template "#{dir}/#{file}.scss", "#{base_path}/#{dir}/#{file}.scss"
      end

      def base_path
        'app/assets/stylesheets'
      end
    end
  end
end
