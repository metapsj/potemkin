require 'singleton'

module Potemkin

  class Pool
    include Singleton

    attr_reader :servers

    def initialize
      @servers = []
    end

    def add_server(server)
      @servers << server
    end

    def run(script_path)
      script = File.read(script_path)
      
      self.instance_eval script, script_path
      
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

end
