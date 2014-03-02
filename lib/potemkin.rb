require_relative 'potemkin/application'
require_relative 'potemkin/server'
require_relative 'potemkin/responder'
require_relative 'potemkin/dsl'

if ARGV.size > 0
  services_path = ARGV.shift
else
  services_path = './config/services.rb'
end

load services_path

Application.instance.run

trap("INT") { Application.instance.shutdown }
