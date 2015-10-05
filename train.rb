require_relative 'station'
require_relative 'route'
require_relative 'passengertrain'
require_relative 'cargotrain'

class Train
   SPEED_CHANGE = 10 # ускорение/замедление
   HOOK_DETACH = 1   # прицепка/отцепка вагона

  attr_accessor :wagon_amount, :speed

  def initialize(train_number, train_type, wagon_amount)
  	@train_number = train_number
  	@train_type = train_type.to_s
  	@wagon_amount = wagon_amount
  	@speed = 0 
  end

  def speed_up
  	if @speed <= 110
  	  @speed += SPEED_CHANGE
  	else
	  puts "Достигнута максимальная скорость!"
    end
  end

  def speed_down
  	if @speed > 0
  		@speed -= SPEED_CHANGE
  	else
  		puts "Поезд стоит на месте!"	
    end
  end

  def hook
  	@wagon_amount += HOOK_DETACH if @speed == 0
  end

  def detach
  	@wagon_amount -= HOOK_DETACH if @speed == 0
  end
  
  def current_station
  	puts "Поезд находится на станции #{self.station.station_name}"
  end
# методы перемещения поезда пока не осилил
end