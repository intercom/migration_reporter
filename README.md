# MigrationReporter

Provides a rake task to report Active Record migration details to a given URL.

## Installation

Add this line to your application's Gemfile:

    gem 'migration_reporter'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install migration_reporter

## Usage

    rake migration_reporter:report_migrations[http://my-build-server.com]

## Payload format

Each migration is sent individually as a HTTP POST in the following JSON format:

```json
{
  "name" : "MyMigration",
  "version" : 20140102030405,
  "filename" : "20140102030405_my_migration.rb",
  "contents" : "class MyMigration < ActiveRecord::Migration\n...",
  "status" : "up"
}
```

## Contributing

1. Fork it ( https://github.com/intercom/migration_reporter/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
