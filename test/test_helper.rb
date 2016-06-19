require_relative '../config/setup'
require 'minitest/autorun'
require 'minitest/reporters'
require 'spy/integration'
require 'webmock/minitest'
require 'codeclimate-test-reporter'

CodeClimate::TestReporter.start

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
