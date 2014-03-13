require_relative 'pool'
require_relative 'server'
require_relative 'responder'

module Potemkin
  module DSL

    Pool = ::Potemkin::Pool.instance
    Server = ::Potemkin::Server
    Responder = ::Potemkin::Responder

    def port(p, &block)
      server = Server.new p
      
      Pool.add_server server
      
      yield if block_given?
    end
    
    def respond(config, &block)
      resource = config[:resource]
      
      h = Responder.new(resource) do |request, response|
        response['Content-Type'] = 'text/xml'
        block.call(request, response) 
      end
      
      Pool.servers.last.add_responder h
    end
    
  end
end