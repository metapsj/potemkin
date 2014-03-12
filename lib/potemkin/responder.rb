module Potemkin
    
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
