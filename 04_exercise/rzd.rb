class Train
   SPEED_CHANGE = 10 # ускорение/замедление
   HOOK_DETACH = 1   # прицепка/отцепка вагона

  attr_accessor :wagon_amount :speed

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

class Station

	attr_reader :name :list_of_trains

	def initialize(name)
	  @name	= name
	  @list_of_trains = []
	end

	def arrival(train)
	  @list_of_trains << train
	  @speed = 0
	end
	
	def departure(train)
	  if @list_of_trains.include?(train)
	    @list_of_trains.delete(train)
	    @speed = 10
	  else
	  puts "Поезда под № #{train_number} нет на станции"
	  end
	end

	def trains_type (type)
	  @list_of_trains.each do |train|
	  puts train.number if train.number == type
	end
end

class Route

	attr_reader :station_a :station_b :station_list :station_route

	def initialize(station_a, station_b)
	  @station_a = station_a
	  @lstation_b = station_b
	  @station_list = []
	  @station_route = [@station_a, @station_list, @station_b].flatten
	end
	
	def add_station (station)
	  self.station_list << station
	  self.station_route = [@station_a, @station_list, @lstation_b].flatten
	end

	def delete_station (station)
	  self.station_list.delete(station)
	  self.station_route = [@station_a, @station_list, @lstation_b].flatten
	end

	def show_stations
	  self.station_route.each do |station|
	  puts station.station_name
	  end
	end	
end