require "rails/generators"

module Suspenders
  class FactoriesGenerator < Rails::Generators::Base
    source_root File.expand_path(
      File.join("..", "..", "..", "templates"),
      File.dirname(__FILE__),
    )

    def set_up_factory_bot
      copy_file "factory_bot.rb", "spec/support/factory_bot.rb"
      copy_file "factory_bot.rake", "lib/tasks/factory_bot.rake"
    end

    def generate_empty_factories_file
      copy_file "factories.rb", "spec/factories.rb"
    end

    def provide_dev_prime_task
      copy_file "dev.rake", "lib/tasks/dev.rake"
    end
  end
end
