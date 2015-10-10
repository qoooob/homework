require_relative 'station'
require_relative 'route'
require_relative 'wagon'
require_relative 'cargowagon'
require_relative 'passengerwagon'
require_relative 'instance_counter'

class Train
  include InstanceCounter

  SPEED_CHANGE = 10

  @@trains = {} 

  def self.all
    @@trains  
  end

  def self.find(number)
    @@trains[number]  
  end
  
  attr_accessor :number, :speed, :route, :current_station, :pre_station, :next_station
  attr_reader :type, :wagon_list

  def initialize(number, type)
  	@number = number
  	@type = type
  	@speed = 0
    @wagon_list = []
    validate!
    @@trains[number] = self
  end

  def valid?
      validate!
      true
    rescue ArgumentError
      false
  end

  def speed_up
  	@speed += SPEED_CHANGE if @speed < 110
  end

  def speed_down
  	@speed -= SPEED_CHANGE if @speed > 0
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
    raise StationError, "Train in Depo" if route.station_list.size == @index + 1
    self.next_station = route.station_list[@index + 1]      
  end
  
  def move_pre_station
    @index -= 1 if @index > 0
    self.pre_station = route.station_list[@index + 1]
    self.current_station = route.station_list[@index]
    raise StationError, "Train in Depo" if self.next_station == 0 && @index == 0
    self.next_station = route.station_list[@index - 1]
  end

  protected
  
  def validate!
    train_number = /^([a-zA-Z0-9]{3})((-| |))([a-zA-Z0-9]{2})$/
    raise ArgumentError, "Number can't be blank" if number.nil? || number.empty?
    raise ArgumentError, "Number should be at least 6 symbols" if number.length != 6
    raise ArgumentError, "Wrong number format! For example 123A" if number !~ train_number
    raise ArgumentError, "Wrong format. Train type can be: cargo or passenger!" if type != "cargo" && type != "passenger"
  end

  def hook(wagon)
    raise SpeedError, "You can't hook a wagon when train move" if @speed != 0
    @wagon_list << wagon
    wagon_number = @wagon_list.size
  end

  def detach(wagon)
    raise SpeedError, "You can't detach a wagon when train move" if @speed != 0
    raise WagonError, "Wagons is out here " if @wagon_list.empty?
    @wagons = @wagon_list.delete_if {|i| i == wagon}  
  end
end