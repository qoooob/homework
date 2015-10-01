class Train
   SPEED_CHANGE = 10 # ускорение/замедление
   HOOK_DETACH = 1   # прицепка/отцепка вагона

  attr_accessor :wagon_amount :speed

  def initialize(train_number, train_type, wagon_amount)
  	@train_number = train_number 		# номер поезда
  	@train_type = train_type.to_s     #тип поезда
  	@wagon_amount = wagon_amount 	#количество вагонов
  	@speed = 0 		 			# текущая скорость
  end

  # метод увеличения скорости
  def speed_up
  	if @speed <= 110
  	  @speed += SPEED_CHANGE
  	else
	  puts "Достигнута максимальная скорость!"
    end
  end

  # метод уменьшения скорости
  def speed_down
  	if @speed > 0
  		@speed -= SPEED_CHANGE
  	else
  		puts "Поезд стоит на месте!"	
    end
  end

  # метод прицепки вагонов
  def hook
  	@wagon_amount += HOOK_DETACH if @speed == 0
  end

  # метод отцепки вагонов
  def detach
  	@wagon_amount -= HOOK_DETACH if @speed == 0
  end
end

class Station

	attr_accessor :list_of_trains

	def initialize(station_name)
	  @station_name	= station_name
	  @list_of_trains = []
	end

	# прибытие поезда
	def arrival(train)
	  if @list_of_trains.include?(train)
	    puts "Поезд #{train_nuber} уже стоит на станции"
	  else
	  @list_of_trains << train
	  end
	end
	
	# отбытие поезда
	def departure(train)
	  if @list_of_trains.include?(train)
	    @list_of_trains.delete(train)
	  else
	  puts "Поезда под № #{train_nuber} нет на станции"
	  end
	end

	# список поездов на станции
	def trains_type (type)
	  @list_of_trains.each do |i|
	  puts i.train_number if i.train_number == type
	end
end

class Route

	attr_accessor :station_list

	def initialize(station_a, station_b)
	  @station_a = station_a
	  @lstation_b = station_b
	  @station_list = []
	end
end
