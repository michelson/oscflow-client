require 'unimidi'

module Oscflow
  module Client
    
    class Midi 
      
      def self.list
        UniMIDI::Device.all.each_with_index.map{|o, index| puts "#{index} #{o.name}"}
          #collect{|o| puts "#{o.id} #{o.name}"}
      end
      
      def listen(device_index)
        input = UniMIDI::Input[device_index]
        puts "selected #{device_index}"
        input.open do |input|
          $stdout.puts "send some MIDI to your input now..."
          loop do
            m = input.gets
            $stdout.puts(m)
          end
        end
      end
      
    end
    
    
  end
end
