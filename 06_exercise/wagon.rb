require_relative 'copyright'
require_relative 'instance_counter'

class Wagon
  include CopyRight
  include InstanceCounter
  
  attr_accessor :wagon_number
  
  def initialize(wagon_number)
  	
  end
end