require 'unimidi'
require "oscflow-client/osc_send"
module Oscflow
  module Client
    
    class Midi 
      
      def self.list
        UniMIDI::Device.all_by_type[:input].each_with_index.map{|o, index| puts "#{index} #{o.name}"}
          #collect{|o| puts "#{o.id} #{o.name}"}
      end
      
      def osc_client(host, port, chan)
        @chan = chan
        @osc_client = Oscflow::Client::OscSend.new
        @osc_client.connect(host, port)
      end
      
      def listen(device_index)
        input = UniMIDI::Input[device_index]
        puts "selected #{device_index}"
        input.open do |input|
          $stdout.puts "send some MIDI to your input now..."
          loop do
            m = input.gets
            @osc_client.send_data(@chan, m)
            $stdout.puts(m)
          end
        end
      end
      
    end
    
    
  end
end
