require_relative 'potemkin/version'
require_relative 'potemkin/application'
require_relative 'core_ext/object'

services_path = ARGV.size > 0 ? ARGV.shift : './example/services.rb'

begin
  Potemkin::Application.instance.script_path = services_path
  Potemkin::Application.instance.run
rescue Interrupt
  Potemkin::Application.instance.shutdown
end
