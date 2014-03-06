require_relative '../potemkin/server'
require_relative '../potemkin/responder'

class Object
  include Potemkin::Server, Potemkin::Responder
end
