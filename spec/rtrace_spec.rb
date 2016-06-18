require_relative '../config/setup'
require 'minitest/autorun'
require 'json'
require 'rtrace'

describe Rtrace do
  before do
    @worker = Rtrace::Worker.new
  end

  after do
    Rtrace::Event.delete_all
  end

  describe '.work' do
    it 'should run Worker' do
      payload = { name: 'order_created' }.to_json
      @worker.work payload
      assert Rtrace::Event.count > 0
    end
  end
end
