# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'date'
require_relative 'lib/sensu-plugins-mysql'

Gem::Specification.new do |s|
  s.authors                = ['Pixum']
  # s.cert_chain             = ['certs/sensu-plugins.pem']
  s.date                   = Date.today.to_s
  s.description            = 'This plugin provides native MySQL instrumentation
                              for monitoring and metrics collection, including:
                              service health, database connectivity, `InnoDB`
                              locks, replication status, metrics collection, and
                              sending metrics to a MySQL database.'
  s.email                  = '<sensu-users@googlegroups.com>'
  s.executables            = Dir.glob('bin/**/*.rb').map { |file| File.basename(file) }
  s.files                  = Dir.glob('{bin,lib}/**/*') + %w[LICENSE README.md CHANGELOG.md]
  s.homepage               = 'https://github.com/Pixum/sensu-plugins-mysql'
  s.license                = 'MIT'
  s.metadata               = { 'maintainer' => 'Pixum',
                               'development_status' => 'active',
                               'production_status' => 'unstable - testing recommended',
                               'release_draft' => 'false',
                               'release_prerelease' => 'false' }
  s.name                   = 'sensu-plugins-mysql'
  s.platform               = Gem::Platform::RUBY
  s.post_install_message   = 'You can use the embedded Ruby by setting EMBEDDED_RUBY=true in /etc/default/sensu'
  s.require_paths          = ['lib']
  s.required_ruby_version  = '>= 2.3.0'
  # s.signing_key            = File.expand_path(pvt_key) if $PROGRAM_NAME =~ /gem\z/
  s.summary                = 'Sensu plugins for MySql'
  s.test_files             = s.files.grep(%r{^(test|spec|features)/})
  s.version                = SensuPluginsMySql::Version::VER_STRING

  s.add_runtime_dependency 'inifile', '3.0.0'
  s.add_runtime_dependency 'ruby-mysql', '~> 2.9'
  s.add_runtime_dependency 'sensu-plugin', '~> 4.0'

  s.add_development_dependency 'bundler',                   '~> 2.1'
  s.add_development_dependency 'codeclimate-test-reporter', '~> 1.0'
  s.add_development_dependency 'github-markup',             '~> 4.0'
  s.add_development_dependency 'pry',                       '~> 0.10'
  s.add_development_dependency 'rake',                      '~> 13.0'
  s.add_development_dependency 'redcarpet',                 '~> 3.2'
  s.add_development_dependency 'rspec',                     '~> 3.1'
  s.add_development_dependency 'rubocop',                   '~> 0.81.0'
  s.add_development_dependency 'yard',                      '~> 0.8'
end
