require 'webrick'
require './lib/potemkin/server'
require './lib/potemkin/responder'

servers = []
threads = []

# default responder
responder = Responder.new "/hello" do |request, response|
  response.body = "<message>hello</message>"
  response['Content-Type'] = 'text/xml'
end

# init first server
servers << Server.new( 2001 )

servers.last.add_responder(responder)

# init second server
servers << Server.new( 2002 )

servers.last.add_responder(responder)

# start all servers in seperate threads
servers.each do |server|
  threads << Thread.new { server.run }
end

# quirky behavior about thread.join; research in further detail
threads.each { |thread| thread.join }

# listen for ctrl-c signal to exit
trap("INT") do 
  servers.each { |server| server.shutdown }
end
