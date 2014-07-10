# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'migration_reporter/version'

Gem::Specification.new do |spec|
  spec.name          = "migration_reporter"
  spec.version       = MigrationReporter::VERSION
  spec.authors       = ["Eugene Kenny"]
  spec.email         = ["eugene@intercom.io"]
  spec.summary       = %q{Provides a rake task to report Active Record migration details to a given URL.}
  spec.homepage      = "https://github.com/intercom/migration_reporter"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "activerecord"
  spec.add_runtime_dependency "httparty"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
