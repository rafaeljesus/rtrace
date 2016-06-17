#!/usr/bin/env ruby

require_relative '../config/setup'
require 'sneakers/runner'
require 'logger'
require 'rtrace'

Sneakers.configure(
  amqp: SETTINGS['amqp_url'],
  daemonize: false,
  log: STDOUT
)
Sneakers.logger.level = Logger::INFO

Sneakers::Runner.new([Rtrace::Worker]).run
