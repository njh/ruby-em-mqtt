#!/usr/bin/env ruby

$:.unshift File.dirname(__FILE__)+'/../lib'

require 'rubygems'
require 'em/mqtt'

EventMachine::error_handler { |e| puts "#{e}: #{e.backtrace.first}" }

EventMachine.run do
  EventMachine::MQTT::ClientConnection.connect('test.mosquitto.org') do |c|
    c.subscribe('test')
    c.receive_callback do |message|
      p message
    end
  end
end
