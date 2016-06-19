require_relative '../test_helper'
require 'rtrace'

describe 'Rtrace::Slack' do
  describe '.notify' do
    it 'should send htto request to slack' do
      stub_request(:any, SETTINGS['slack_url'])

      payload = { name: 'order_created' }
      p = Rtrace::Slack.notify(payload).execute
      assert_instance_of Concurrent::Promise, p
    end
  end
end
