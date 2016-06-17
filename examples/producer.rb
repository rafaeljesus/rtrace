require 'bunny'
require 'json'

connection = Bunny.new
connection.start
channel = connection.create_channel
queue = channel.queue 'events', durable: true

json = {
  name: 'order_created',
  payload: {
    number: '12345678',
    items: [{
      quantity: 1
    }]
  }
}.to_json

queue.publish json

connection.close
