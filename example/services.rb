port 2001

respond :resource => "/hello" do |request, response|
  response.body = "<message>hello</message>"
end

respond :resource => "/bye" do |request, response|
  response.body = "<message>bye</message>"
end

respond :resource => "/time" do |request, response|
  response.body = "<now>#{Time.new}</now>"
end

port 2002

respond :resource => "/hello" do |request, response|
  response.body = "<message>hello</message>"
end

respond :resource => "/bye" do |request, response|
  response.body = "<message>bye</message>"
end

respond :resource => "/time" do |request, response|
  response.body = "<now>#{Time.new}</now>"
end