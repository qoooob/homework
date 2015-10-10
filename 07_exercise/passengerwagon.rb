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
      raise SeatError, "Wagon is empty" if self.free_seats == 0
      self.seat += 1 if self.free_seats > 0
  end
  
  def sit_down
    raise SeatError, "Wagon is full" if self.busy_seats == MAX_SEAT
      self.seat -= 1 if self.busy_seats > 0
  end
end