require 'json'
require 'sneakers'
require 'slack-notifier'
require 'concurrent'

require 'rtrace/version'
require 'rtrace/event'

module Rtrace
  class Trace
    include Sneakers::Worker
    from_queue 'events'

    def initialize
      @notifySlack = Slack::Notifier.new(SETTINGS['slack_url'])
    end

    def work(message)
      payload = JSON.parse(message)

      createEvent = Concurrent::Promise.new { Event.create(payload) }
      notifySlack = Concurrent::Promise.new { @notifySlack.ping('Event created -> #{payload.name}') }

      Concurrent::Promise
        .all?(createEvent, notifySlack)
        .then{ !ack }
        .execute
    end
  end
end
