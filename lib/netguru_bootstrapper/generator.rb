require 'thor'
require_relative './structure_parser'

module NetguruBootstrapper
  class Generator < Thor::Group
    include Thor::Actions

    class_option :path

    def self.source_root
      File.expand_path('../templates', __FILE__)
    end

    def create_root_file
      say "Using #{base_path} as root directory", :blue
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
      options[:path] ? options[:path] : default_assets_path
    end

    def default_assets_path
      'app/assets/stylesheets'
    end
  end
end
