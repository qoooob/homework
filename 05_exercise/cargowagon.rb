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
  	if vol > MAX_CAPACITY
  	print "Максимальная вместимость вагона равна #{MAX_CAPACITY}, уменьшите размер груза!"
  	else
  	  self.capacity -= vol
  	  if free_capacity < 0
  	  	self.capacity = 0 
  		print "Вагон загружен полностью!"
  	  else
  		print "В Вагоне осталось #{@capacity} единиц свободного места"
      end
    end
  end
  
  def unload(vol)
  	if vol > MAX_CAPACITY
  	print "В вагоне нет столько груза, максимальный размер вагона равен #{MAX_CAPACITY}, уменьшите размер выгружаемого груза!"
  	else
  	  self.capacity += vol
  	  if booked_capacity < 0
  	    self.capacity = MAX_CAPACITY
  		print "Вагон разгружен полностью!"
  	  else
  		print "В Вагоне осталось #{@capacity} единиц свободного места"
      end
    end
  end
end