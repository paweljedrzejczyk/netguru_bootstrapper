require 'yaml'
require 'ostruct'

module NetguruBootstrapper
  class StructureParser < OpenStruct
    def initialize
      path = File.expand_path('../../structure.yml', __FILE__)
      super(YAML.load_file(path))
    end
  end
end
