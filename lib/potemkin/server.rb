require 'webrick'

module Potemkin

  class Server
    attr_reader :port, :responders
    
    def initialize(port)
      @port = port
      @responders = []
    end
    
    def add_responder(h)
      @responders << h
    end

    def start
      @http_server = WEBrick::HTTPServer.new( :Port => @port )
      
      @responders.each do |h|
        @http_server.mount_proc(h.resource) do |request, response|
          h.handle(request, response)
        end
      end

      @http_server.start
    end

    def stop
      @http_server.shutdown
    end
  end

end