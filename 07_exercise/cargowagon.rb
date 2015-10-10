require_relative 'wagon'

class CargoWagon < Wagon
  
  MAX_CAPACITY = 100
  attr_accessor :capacity
  
  def initialize
    @capacity = MAX_CAPACITY
  end
  
  def free_capacity
    @capacity
  end

  def booked_capacity
    MAX_CAPACITY - @capacity
  end 
  
  def upload(vol)
    capacity = /^[1][0][0]|\d{2}$/
  	raise CapacityError, "Max Capacity is 100" if vol > MAX_CAPACITY
    raise CapacityError, "Put Capacity in digitals. Max 100!" if vol !~ capacity
    raise CapacityError, "Wagon is full" if free_capacity == 0
  	 self.capacity -= vol
  end
  
  def unload(vol)
    capacity = /^[1][0][0]|\d{2}/
    raise CapacityError, "Max Capacity is 100" if vol > MAX_CAPACITY
    raise CapacityError, "Plese check booked_capacity first" if vol > booked_capacity
    raise CapacityError, "Put Capacity in digitals. Max 100!" if vol !~ capacity
    raise CapacityError, "Wagon is empty" if self.capacity == MAX_CAPACITY
  	self.capacity += vol
  end
end