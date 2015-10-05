require_relative 'wagon'

class PassengerWagon < Wagon

  MAX_SEAT = 40
  attr_accessor :seat

  def initialize
    @seat = MAX_SEAT
  end
  
  def free_seats
    MAX_SEAT - @seat
  end
  
  def busy_seats
    @seat   
  end
  
  def sit_up
    if self.free_seats > 0
      self.seat += 1
      print "Освободилось место #{@seat}"
  	  else
      print "Вагон пустой!"
    end
  end
  
  def sit_down
	  if self.busy_seats > 0
      self.seat -= 1
		  print "Ваше место #{@seat}"
    else
	    print "Вагон заполнен!"
    end
  end
end