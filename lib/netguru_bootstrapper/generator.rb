require 'thor'
require_relative './structure_parser'

module NetguruBootstrapper
  class Generator < Thor::Group
    include Thor::Actions

    class_option :path, default: 'app/assets/stylesheets'
    class_option :bootstrap_path, default: 'bootstrap'

    def self.source_root
      File.expand_path('../templates', __FILE__)
    end

    def create_root_file
      say "Using #{options[:path]} as root directory", :blue
      template 'application.scss', "#{options[:path]}/application.scss"
    end

    def create_directories
      structure.directories.each do |dir|
        empty_directory "#{options[:path]}/#{dir}"
        create_files(dir, structure.files[dir])
      end
    end

    private

    def structure
      StructureParser.new
    end

    def create_files(dir, files)
      return create_file "#{options[:path]}/#{dir}/.gitkeep" if files.nil?
      files.each { |file| copy_template(dir, file) }
    end

    def copy_template(dir, file)
      template "#{dir}/#{file}.scss", "#{options[:path]}/#{dir}/#{file}.scss"
    end
  end
end
