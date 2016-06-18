require_relative 'test_helper'
require 'spy'
require 'json'
require 'rtrace'

describe 'Rtrace::Worker' do
  let(:worker) { Rtrace::Worker.new }

  describe '.work' do
    it 'should perform work' do
      event_spy = Spy.on(Rtrace::Event, :trace).and_return { Concurrent::Promise.new }
      slack_spy = Spy.on(Rtrace::Slack, :notify).and_return { Concurrent::Promise.new }

      payload = { name: 'order_created' }.to_json
      worker.work payload

      assert event_spy.has_been_called?
      assert slack_spy.has_been_called?
    end
  end
end
