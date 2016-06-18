require 'concurrent'
require 'slack-notifier'

module Rtrace
  class Slack
    def initialize
      @notifySlack = Slack::Notifier.new SETTINGS['slack_url']
    end

    def self.notify payload
      Concurrent::Promise.new { @notifySlack.ping "Event created -> #{payload.name}" }
    end
  end
end
