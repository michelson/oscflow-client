require 'unimidi'

module Oscflow
  module Client
    class Midi 
      def self.list
         UniMIDI::Device.list
      end
    end
  end
end
