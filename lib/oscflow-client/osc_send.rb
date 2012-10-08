require "osc-ruby"
module Oscflow
  module Client
    
    class OscSend
      def connect(host="localhost",port=8080)
        @client = OSC::Client.new( host, port )
        puts "Connected to #{host}:#{port}"
      end
      
      def send_data(channel, *args)
        puts "send message #{args[0].size} #{args.size}"
        args[0].each do |arg|
          @client.send( OSC::Message.new( "/chan/#{channel}" , arg.to_s ))
        end
      end
      
      def rec(channel)
        connect("localhost", 8080) unless @client
        @client.send( OSC::Message.new( "/chan/#{channel}" , "rec" ))
      end
      
      def stop(channel)
        connect("localhost", 8080) unless @client
        @client.send( OSC::Message.new( "/chan/#{channel}" , "stop" ))
      end
    end
  end
end