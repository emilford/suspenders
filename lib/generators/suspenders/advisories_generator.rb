module Suspenders
  module Generators
    class AdvisoriesGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates/advisories", __FILE__)
      desc(<<~TEXT)
        Show security advisories during development.

        Uses the `bundler-audit` gem to update the local security database and
        show any relevant issues with the app's dependencies via a Rake task.
      TEXT

      def add_bundler_audit
        gem_group :development, :test do
          gem "bundler-audit", ">= 0.7.0", require: false
        end
        Bundler.with_unbundled_env { run "bundle install" }
      end

      def modify_rakefile
        insert_into_file "Rakefile", "\nrequire \"bundler/audit/task\"",
          after: 'require_relative "config/application"'
        insert_into_file "Rakefile", "\nBundler::Audit::Task.new",
          after: 'require "bundler/audit/task"'
      end
    end
  end
end