require 'rails/generators'

module NetguruBootstrapper
  module Generators
    class BootstrapGenerator < ::Rails::Generators::Base
      desc 'Bootstrap CSS generator'
      source_root File.expand_path("../../templates", __FILE__)
    end
  end
end
