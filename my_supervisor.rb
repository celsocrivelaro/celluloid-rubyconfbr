require 'celluloid'
require_relative 'my_actor'

class MySupervisor
  include Celluloid
  trap_exit :actor_died

  def initialize
    @my_actor = MyActor.new_link('A1')
  end

  def execute_badly
    @my_actor.async.do_something_badly
  end

  def actor_died(actor, error)
    p "#{actor.inspect} has died because of a #{error.class}: #{error.message}"
  end
end
