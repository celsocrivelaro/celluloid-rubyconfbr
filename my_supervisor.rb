require 'celluloid/current'
require_relative 'my_actor'

class MySupervisor
  include Celluloid
  trap_exit :actor_died

  attr_reader :my_actor

  def initialize
    @my_actor = MyActor.new_link('A1')
  end

  def execute_badly
    @my_actor.async.do_something_badly
  end

  def actor_died(actor, error)
    if error.nil?
      p "#{actor.inspect} has finished. Bye bye!"
    else
      p "#{actor.inspect} has died because of a #{error.class}: #{error.message}"
    end
  end
end


