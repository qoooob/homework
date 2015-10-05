require_relative 'station'
require_relative 'route'
require_relative 'wagon'
require_relative 'cargowagon'
require_relative 'passengerwagon'

class Train
  SPEED_CHANGE = 10 # ускорение/замедление

  attr_accessor :train_number, :speed, :route, :current_station, :pre_station, :next_station
  attr_reader :type, :wagon_list

  def initialize(train_number, type)
  	@train_number = train_number
  	@type = type
  	@speed = 0
    @wagon_list = []
  end

  def speed_up
  	if @speed <= 110
  	  @speed += SPEED_CHANGE
  	else
	  print "Достигнута максимальная скорость!"
    end
  end

  def speed_down
  	if @speed > 0
  		@speed -= SPEED_CHANGE
  	else
  		print "Поезд стоит на месте!"	
    end
  end

  def accept_route(route)
    @index = 0
    self.route = route
    self.pre_station = "Депо"
    self.current_station = route.station_list[@index]
    self.next_station = route.station_list[@index + 1]
  end

  def move_next_station
    @index += 1 if route.station_list.size > @index + 1
    self.pre_station = route.station_list[@index - 1]
    self.current_station = route.station_list[@index]
    if route.station_list.size == @index + 1
      print "Поезд в Депо"
    else
      self.next_station = route.station_list[@index + 1]      
    end
  end
  
  def move_pre_station
    @index -= 1 if @index > 0
    self.pre_station = route.station_list[@index + 1]
    self.current_station = route.station_list[@index]
    if self.next_station == 0 && @index == 0
      print "Поезд в Депо"
    else
      self.next_station = route.station_list[@index - 1]
    end  
  end

  #protected
  
  def hook(wagon)
    if @speed == 0
        @wagon_list << wagon
        wagon_number = @wagon_list.size
        print "В составе #{@wagon_list.size} вагонов."
    else
      print "Сначала остановите поезд!"
    end
  end

  def detach(wagon)
    if @speed == 0 && @wagon_list.empty? == false
      @wagons = @wagon_list.delete_if {|i| i == wagon} 
      print "В составе #{@wagon_list.size} вагонов."
    elsif @speed != 0
        print "Сначала остановите поезд!"
    elsif @wagon_list.empty? == true
      print "В составе нет вагонов."
    end 
  end
end