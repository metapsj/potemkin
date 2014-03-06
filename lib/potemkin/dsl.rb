module Kernel

  def port(p)
    server = Server.new p
    Application.instance.add_server server
  end

  def respond(config, &block)
    resource = config[:resource]

    h = Responder.new(resource) do |request, response|
      response['Content-Type'] = 'text/xml'
      block.call(request, response) 
    end

    Application.instance.servers.last.add_responder h
  end

end