require_relative 'server'
require_relative 'responder'

module Potemkin
  module DSL

    Application = ::Potemkin::Application.instance
    Server = ::Potemkin::Server
    Responder = ::Potemkin::Responder
    
    def port(p)
      server = Server.new p
      Application.add_server server
    end

    def respond(config, &block)
      resource = config[:resource]

      h = Responder.new(resource) do |request, response|
        response['Content-Type'] = 'text/xml'
        block.call(request, response) 
      end

      Application.servers.last.add_responder h
    end
    
  end
end