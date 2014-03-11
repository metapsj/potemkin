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

#server :port => 2001 do |request, response|
#  respond :resource => '/hello', :body => '<message>hello</message>'
#  respond :resource => '/bye', :body => '<message>bye</message>'
#  respond :resource => '/time', :body => '<message>#{Time.now}</message>'
#end
