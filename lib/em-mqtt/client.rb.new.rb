# Client class for talking to an MQTT broker
class MQTT::Client
  attr_reader :remote_host    # Hostname of the remote broker
  attr_reader :remote_port    # Port number of the remote broker
  attr_accessor :keep_alive   # Time (in seconds) between pings to remote broker
  attr_accessor :clean_start  # Set the 'Clean Start' flag when connecting?
  attr_accessor :client_id    # Client Identifier
  attr_accessor :ack_timeout  # Number of seconds to wait for acknowledgement packets

  # Create a new MQTT Client instance
  def initialize(remote_host=MQTT::DEFAULT_HOST, remote_port=MQTT::DEFAULT_PORT)
    @remote_host = remote_host
    @remote_port = remote_port
    @keep_alive = 10
    @clean_start = true
    @client_id = nil
    @ack_timeout = 5
    @connection = nil
  end

  def self.connect(*args, &blk)
    self.new(*args).connect(&blk)
  end

  # Connect to the MQTT broker
  # A block must be given
  def connect
    #trap("INT") {EM.stop}

    EventMachine.run do
      @connection = MQTT::ClientConnection.connect(@remote_host, @remote_port)

      # Stuff happens here
      yield(self)

      # Disconnect once all the other deferred callbacks
      @connection.callback do
        disconnect
      end

      puts "Finished initing run"
    end
  end

  # Disconnect from the MQTT broker.
  # If you don't want to say goodbye to the broker, set send_msg to false.
  def disconnect(send_msg=true)
    @connection.disconnect(send_msg) unless @connection.nil?
  end

  # Checks whether the client is connected to the broker.
  def connected?
    # FIXME: check if connection is connected
    not @connection.nil?
  end

  # Publish a message on a particular topic to the MQTT broker.
  def publish(topic, payload, retain=false, qos=0)
    # FIXME: make sure @connection isn't nil
    @connection.publish(topic, payload, retain, qos=0)
  end

  # Send a subscribe message for one or more topics on the MQTT broker.
  # The topics parameter should be one of the following:
  # * String: subscribe to one topic with QOS 0
  # * Array: subscribe to multiple topics with QOS 0
  # * Hash: subscribe to multiple topics where the key is the topic and the value is the QOS level
  #
  # For example:
  #   client.subscribe( 'a/b' )
  #   client.subscribe( 'a/b', 'c/d' )
  #   client.subscribe( ['a/b',0], ['c/d',1] )
  #   client.subscribe( 'a/b' => 0, 'c/d' => 1 )
  #
  def subscribe(*topics)
    # FIXME: make sure @connection isn't nil
    @connection.subscribe(*topics)
  end

  # Return the next message recieved from the MQTT broker.
  # This method blocks until a message is available.
  #
  # The method returns the topic and message as an array:
  #   topic,message = client.get
  #
  def get(*topics)
    # FIXME: implement this
  end

  # Send a unsubscribe message for one or more topics on the MQTT broker
  def unsubscribe(*topics)
    # FIXME: make sure @connection isn't nil
    @connection.unsubscribe(*topics)
  end

end
