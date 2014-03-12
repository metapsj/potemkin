require_relative 'potemkin/version'
require_relative 'potemkin/application'
require_relative 'core_ext/object'

app = Potemkin::Application.new(ARGV)

begin
  app.start
rescue Interrupt
  app.stop
end
