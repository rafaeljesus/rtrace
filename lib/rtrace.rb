require 'json'
require 'sneakers'

require 'rtrace/version'
require 'rtrace/event'
require 'rtrace/slack'

module Rtrace
  class Worker
    include Sneakers::Worker
    from_queue 'events'

    def work(message)
      payload = JSON.parse(message)
      promises = [Event.trace(payload), Slack.notify(payload)]
      promises.map(&:execute).map { |p| p.tap(&:value) }
      ack!
    end
  end
end
