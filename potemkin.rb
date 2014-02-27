require 'webrick'
include WEBrick

s = HTTPServer.new( :Port => 2020 )

s.mount_proc("/hello/again") do |req, res|
  res.body = "<the><same><bit>of XML</bit></same></the>"
  res['Content-Type'] = "text/xml"
end

trap("INT") { s.shutdown }
s.start
