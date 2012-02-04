#!/usr/bin/env ruby

$:.unshift File.dirname(__FILE__)+'/../lib'

require 'rubygems'
require 'em-mqtt'

include EventMachine::MQTT

EventMachine.run do
  c = ClientConnection.connect('test.mosquitto.org')
  EventMachine::PeriodicTimer.new(1.0) do
    puts "-- Publishing time"
    c.publish('test', "The time is #{Time.now}")
  end
end
