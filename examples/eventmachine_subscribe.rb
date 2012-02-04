#!/usr/bin/env ruby

$:.unshift File.dirname(__FILE__)+'/../lib'

require 'rubygems'
require 'em-mqtt'


class MyConnection < EventMachine::MQTT::ClientConnection

  def receive_msg(packet)
    p packet
  end

end


EventMachine.run do
  MyConnection.connect('test.mosquitto.org') do |c|
    c.subscribe('test')
  end
end
