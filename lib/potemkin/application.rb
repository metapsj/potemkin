require 'singleton'

class Application
  include Singleton
  
  attr_reader :servers
  
  def initialize
    @servers = []
  end

  def add_server(server)
    @servers << server
  end

  def run
    threads = []
    
    @servers.each do |server|
      threads << Thread.new { server.run }
    end
    
    threads.each { |thread| thread.join }
  end

  def shutdown
    @servers.each { |server| server.shutdown }
  end
end
