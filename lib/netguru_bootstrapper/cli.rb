require 'thor'
require_relative './generator'

module NetguruBootstrapper
  class Cli < ::Thor
    include Thor::Actions

    desc "install", "Generate tree structure"
    def install
      say 'Generating tree structure...', :blue
      Generator.start(ARGV)
    end
  end
end
