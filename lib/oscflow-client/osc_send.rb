require "osc-ruby"
module Oscflow
  module Client
    
    class OscSend
      def connect(host="localhost",port=8080)
        @client = OSC::Client.new( host, port )
        puts "Connected to #{host}:#{port}"
      end
      
      def send_data(channel, *args)
        #puts "send message #{args}"
        @client.send( OSC::Message.new( "/chan/#{channel}" , args.to_s ))
      end
      
      def rec(channel)
        #connect(host, port)
        @client.send( OSC::Message.new( "/chan/#{channel}" , "rec" ))
      end
      
      def stop(channel)
        #connect(host,port)
        @client.send( OSC::Message.new( "/chan/#{channel}" , "stop" ))
      end
    end
  end
end