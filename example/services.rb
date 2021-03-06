port 2001 do
  respond :resource => "/hello" do |request, response|
    response.body = "<message>hello</message>"
  end

  respond :resource => "/bye" do |request, response|
    response.body = "<message>bye</message>"
  end

  respond :resource => "/time" do |request, response|
    response.body = "<time>#{Time.new}</time>"
  end
end

port 2002 do
  respond :resource => "/hello" do |request, response|
    response.body = "<message>hello</message>"
  end

  respond :resource => "/bye" do |request, response|
    response.body = "<message>bye</message>"
  end

  respond :resource => "/time" do |request, response|
    response.body = "<time>#{Time.new}</time>"
  end
end
