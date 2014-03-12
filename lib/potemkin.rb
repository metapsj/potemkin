require_relative 'potemkin/version'
require_relative 'potemkin/application'
require_relative 'core_ext/object'

App = Potemkin::Application.new(ARGV)

begin
  App.start
rescue Interrupt
  App.stop
end
