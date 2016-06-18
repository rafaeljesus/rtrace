require 'concurrent'

module Rtrace
  class Event
    include Mongoid::Document

    field :name, type: String
    field :payload, type: Hash

    def self.trace event
      Concurrent::Promise.new { self.create event }
    end
  end
end
