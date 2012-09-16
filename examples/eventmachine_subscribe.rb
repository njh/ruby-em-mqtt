#!/usr/bin/env ruby

$:.unshift File.dirname(__FILE__)+'/../lib'

require 'rubygems'
require 'em-mqtt'

EventMachine.run do
  EventMachine::MQTT::ClientConnection.connect('test.mosquitto.org') do |c|
    c.subscribe('test')
    c.receive_callback do |message|
      p message
    end
  end
end
