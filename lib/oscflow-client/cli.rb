require "thor"
require "thor/group"
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
  end
end