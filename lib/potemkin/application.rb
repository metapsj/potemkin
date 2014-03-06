require 'singleton'
require 'optparse'

module Potemkin

  class Application
    include Singleton

    attr_reader :servers
    attr_accessor :script, :script_path

    def initialize
      @servers = []
    end

    def add_server(server)
      @servers << server
    end

    def run
      @script = File.read(@script_path)

      self.instance_eval @script, @script_path

      threads = []
      
      @servers.each do |server|
        threads << Thread.new { server.run }
      end
      
      threads.each { |thread| thread.join }
    end

    def shutdown
      @servers.each { |server| server.shutdown }
    end

    private 

    def parse_options(argv)
      puts 'Application::parse_options'
    end
  end

end