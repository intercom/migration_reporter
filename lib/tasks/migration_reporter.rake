namespace :migration_reporter do
  desc "Report migration details to the given URL"
    task :report_migrations, [:url] => :environment do |t, args|
    MigrationReporter.report_migrations(args[:url])
  end
end
