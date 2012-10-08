require "thor"
require "thor/group"
require "oscflow-client/midi"
module Oscflow::Client
  class CLI < Thor
    include Thor::Actions

    STATUS_TYPES = {:success          => 0,
                    :general_error    => 1,
                    :not_supported    => 3,
                    :not_found        => 4,
                    :incorrect_usage  => 64,
                    }

    no_tasks {
      def cli_error(message, exit_status=nil)
        $stderr.puts message
        exit_status = STATUS_TYPES[exit_status] if exit_status.is_a?(Symbol)
        exit(exit_status || 1)
      end
    }
    
    map %w(--version -v) => 'info'
    desc "info", "information about Oscflow::Client."
    def info
      say "Version #{::Oscflow::Client::VERSION}"
    end
    
    map %w(--l) => 'list'
    desc "list", "list midi devices"
    def list
      say  Oscflow::Client::Midi.list
    end
    
    map %w(--stop) => 'stop'
    desc "stop", "stop osc recording"
    def stop
      host = "localhost" #defaults to oscflow!
      port = 8080
      chan = ask("which channel do you want to send messages?")
      Oscflow::Client::OscSend.new.stop(chan)
    end
    
    map %w(--red) => 'rec'
    desc "rec", "record a osc session"
    def rec
      chan = ask("which channel do you want to send messages?")
      Oscflow::Client::OscSend.new.rec(chan)
    end
    
    map %w(--input --start) => 'start_session'
    desc "input", "listen midi input"
    def start_session
      #say 
      Oscflow::Client::Midi.list
      device = ask("which device you want to use?")
      host = "localhost" #defaults to oscflow!
      port = 8080
      chan = ask("which channel do you want to send messages?")
      midiin = Oscflow::Client::Midi.new
      midiin.osc_client(host, port, chan)
      midiin.listen(device.to_i)
    end
    
    
  end
end