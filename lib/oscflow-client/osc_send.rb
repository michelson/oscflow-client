module Oscflow
  module Client
    
    class OscSend
      def connect(host="localhost",port=8080)
        @client = OSC::Client.new( host, port )
        puts "Connected to #{host}:#{port}"
      end
      
      def send_data(channel, message)
        @client.send( OSC::Message.new( "/#{channel}" , message ))
      end
      
    end
  end
end