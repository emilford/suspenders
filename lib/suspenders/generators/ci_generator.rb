require "rails/generators"

module Suspenders
  class CiGenerator < Rails::Generators::Base
    source_root File.expand_path(
      File.join("..", "..", "..", "templates"),
      File.dirname(__FILE__))

    def configure_ci
      template "circle.yml.erb", "circle.yml"
    end
  end
end
