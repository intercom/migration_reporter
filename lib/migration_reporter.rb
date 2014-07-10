require "migration_reporter/railtie"
require "migration_reporter/version"

module MigrationReporter
  class << self
    def report_migrations(url)
      paths = ActiveRecord::Migrator.migrations_paths
      ActiveRecord::Migrator.migrations(paths).each do |migration|
        contents = File.read(migration.filename)
        report_migration(url, migration, contents)
      end
    end

    def report_migration(url, migration, contents)
      headers = { 'Content-Type' => 'application/json' }
      body = {
        :name => migration.name,
        :version => migration.version,
        :filename => migration.filename,
        :status => migrated_versions.include?(migration.version) ? "up" : "down",
        :contents => contents
      }.to_json

      HTTParty.post(url, :headers => headers, :body => body)
    end

    def migrated_versions
      @all_versions ||= ActiveRecord::Migrator.get_all_versions
    end
  end
end
