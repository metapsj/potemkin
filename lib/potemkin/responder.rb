module Potemkin
  module Responder
    
    def respond(config, &block)
      resource = config[:resource]
      
      h = Responder.new(resource) do |request, response|
        response['Content-Type'] = 'text/xml'
        block.call(request, response) 
      end
      
      Application.instance.servers.last.add_responder h
    end
    
    class Responder
      attr_reader :resource

      def initialize(resource, &block)
        @resource  = resource
        @block = block
      end

      def handle(request, response)
        @block.call request, response
      end
    end

  end
end
