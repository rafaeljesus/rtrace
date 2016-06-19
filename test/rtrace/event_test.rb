require_relative '../test_helper'
require 'rtrace'

describe 'Rtrace::Event' do
  after { Rtrace::Event.delete_all }

  describe '.trace' do
    it 'should trace event' do
      payload = { name: 'order_created' }
      p = Rtrace::Event.trace(payload).execute
      refute_nil p.value._id
    end
  end
end
