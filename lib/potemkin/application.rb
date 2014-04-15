require 'optparse'
require_relative 'pool'

module Potemkin

  class Application
    attr_reader :script_path, :pool

    def initialize(argv)
      @pool = Pool.instance

      @script_path = argv.size > 0 ? argv.shift : './example/services.rb'
    end

    def run
      script = File.read(@script_path)

      self.instance_eval script, @script_path

      @pool.start
    end
    
    def stop
      @pool.stop
    end
    
    private
    
    def parse_options(argv)
      puts '#{self.class} - parse_options'
    end
  end

end
