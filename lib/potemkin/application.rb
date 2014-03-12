require 'optparse'
require_relative 'pool'

module Potemkin

  class Application
    attr_reader :script_path, :pool

    def initialize(argv)
      @pool = Pool.instance

      @script_path = argv.size > 0 ? argv.shift : './example/services.rb'
    end

    def start
      @pool.run(@script_path)
    end
    
    def stop
      @pool.shutdown
    end
    
    private
    
    def parse_options(argv)
      puts 'Application::parse_options'
    end
  end

end
