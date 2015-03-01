$:.unshift(File.dirname(__FILE__))

require 'spec_helper'

describe EventMachine::MQTT::Connection do

  let(:signature) { double('signature') }
  let(:subject) { EventMachine::MQTT::Connection.new(signature) }
  let(:packet) { MQTT::Packet::Publish.new( :topic => 'test', :payload => 'hello world' ) }

  describe "when receiving data" do
    it "should parse packets" do
      expect(subject).to receive(:process_packet).exactly(:once)
      subject.receive_data packet.to_s
    end

    it "should handle multiple packets at once" do
      expect(subject).to receive(:process_packet).exactly(:twice)
      subject.receive_data [packet, packet].join
    end
  end

end
