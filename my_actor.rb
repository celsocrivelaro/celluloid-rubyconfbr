require 'celluloid'

class MyActor
  include Celluloid

  attr_reader :last_inc

  def initialize(name)
    @name = name
    @last_inc = 0
  end

  def do_something
    puts "Actor #{@name} is doing something..."
  end

  def inc(num)
    @last_inc = num + 1
  end
end
