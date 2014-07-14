module MigrationReporter
  class Railtie < ::Rails::Railtie
    rake_tasks do
      load "tasks/migration_reporter.rake"
    end
  end
end
