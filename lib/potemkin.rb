require_relative 'potemkin/application'
require_relative 'potemkin/server'
require_relative 'potemkin/responder'

if ARGV.size > 0
  services_path = ARGV.shift
else
  services_path = './config/services.rb'
end

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

load services_path

Application.instance.run

trap("INT") { Application.instance.shutdown }
