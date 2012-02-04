ruby-em-mqtt
============

This gem adds MQTT (Message Queue Telemetry Transport) protocol support to EventMachine,
an event-processing library for Ruby.


Installing
----------

You may get the latest stable version from rubygems.org:

    $ gem install em-mqtt
    
It depends upon the mqtt gem to perform packet parsing and serialising.


Synopsis
--------

    require 'rubygems'
    require 'em-mqtt'
    
    # Publish example
    EventMachine.run do
      c = ClientConnection.connect('test.mosquitto.org')
      EventMachine::PeriodicTimer.new(1.0) do
        puts "-- Publishing time"
        c.publish('test', "The time is #{Time.now}")
      end
    end

    
    # Subscribe example
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


Resources
---------

* MQTT Homepage: http://www.mqtt.org/
* GitHub Project: http://github.com/njh/ruby-em-mqtt
* Documentation: http://rubydoc.info/gems/em-mqtt/frames


Contact
-------

* Author:    Nicholas J Humfrey
* Email:     njh@aelius.com
* Home Page: http://www.aelius.com/njh/
* License:   Distributes under the same terms as Ruby
