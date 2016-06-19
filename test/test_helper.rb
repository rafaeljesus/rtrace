require_relative '../config/setup'
require 'minitest/autorun'
require 'minitest/reporters'
require 'spy/integration'
require 'webmock/minitest'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
