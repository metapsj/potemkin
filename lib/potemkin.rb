require_relative 'potemkin/version'
require_relative 'potemkin/application'
require_relative 'core_ext/object'

begin
  Potemkin::Application.instance.run(ARGV)
rescue Interrupt
  Potemkin::Application.instance.shutdown
end
