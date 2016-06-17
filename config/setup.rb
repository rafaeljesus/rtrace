require 'bundler/setup'
require 'yaml'
require 'mongoid'

lib_path = File.expand_path '../../lib', __FILE__
$LOAD_PATH.unshift lib_path

ENVIRONMENT = ENV['ENVIRONMENT'] || 'development'

settings_file = File.expand_path '../settings.yml', __FILE__
SETTINGS = YAML.load_file(settings_file)[ENVIRONMENT]

mongo_file = File.expand_path '../mongoid.yml', __FILE__
Mongoid.load!(mongo_file, ENVIRONMENT)

if %w(development test).include? ENVIRONMENT
  require 'byebug'
end
