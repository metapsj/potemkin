require 'singleton'

module Potemkin
  
  class Pool
    include Singleton

    attr_reader :servers

    def initialize
      @servers = []
    end

    def add_server(server)
      @servers << server
    end

    def start      
      threads = []
      
      @servers.each do |server|
        threads << Thread.new { server.start }
      end
      
      threads.each { |thread| thread.join }
    end

    def stop
      @servers.each { |server| server.stop }
    end
  end

end
