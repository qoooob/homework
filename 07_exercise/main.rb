require_relative 'train'
require_relative 'station'
require_relative 'route'
require_relative 'wagon'
require_relative 'cargowagon'
require_relative 'passengerwagon'
require_relative 'passengertrain'
require_relative 'cargotrain'

class Menu
  
  def initialize
    @stations = []
    @routes = []
    @trains = []
  end

  def main_menu
  	loop do
	  puts "Введите номер для выбора действия:
	  1. Создать станицю
	  2. Создать маршрут
	  3. Создание поезда
	  4. Добавление/удаление вагонов поезда
	  5. Поместить поезд на станцию
	  6. Загрузка/разгрузка вагонов
	  7. Занять/осовободить место в пассажирском вагоне
	  8. Посмотреть список станций
	  9. Посмотреть список поездов на станции
	  0. Выход из программы"
	
	  menu = gets.chomp.to_i

	  case menu

		when 0
		  break
		when 1
		  self.create_stations
		when 2
		  self.create_routs
		when 3
	      self.create_trains
		when 4
		  self.hook_unhook_wagon
		when 5
		  self.go_to_station
		when 6
		  self.fill_cargo_wagon
		when 7
		  self.fill_passenger_wagon
		when 8
		  self.show_stations
		when 9
		  self.show_trains
		else
			puts "Нет такого пункта меню"
		break
		end
	end	
  end

  def create_stations
	loop do
	    begin
	    print "Введите название станции. Введите 0 при завершении: "
	    name = gets.strip
	    break if name == "0"
	    @stations << Station.new(name)
      rescue ArgumentError
        puts "Введите корректное название станции: допустимы только буквы и цифры!"
        retry
      end
    end
  end

  def create_routs
   begin
    print "Создание маршрута."
    puts "Введите начальную станицию: "
    first_station = gets.strip
    puts "Введите конечную станицию: "
    second_station = gets.strip
    @routes << Route.new(first_station, second_station)	
    rescue ArgumentError
      puts "Введите корректное название станции!"
      retry
    end
  end

  def create_trains
  	print "Создание поезда"
  	loop do
  	  puts "Введите тип поезда: 1 - пассжирский, 2 -грузовой, 0 - завершение ввода."
  	  type = gets.chomp.to_i

      case type
        when 1
          begin
	        puts "Введите номер поезда:"
  	      train_number = gets.chomp
          @trains << PassengerTrain.new(train_number)
          rescue ArgumentError
            puts "Введите корректный номер поезда!(XXX-XX)"
            retry
          end
        when 2
          begin
          puts "Введите номер поезда:"
  	      train_number = gets.chomp
  	      @trains << CargoTrain.new(train_number)
          rescue ArgumentError
            puts "Введите корректный номер поезда! (XXX-XX)"
            retry
          end
  	    when 0
  		  break
  	    else
  	  	  puts "Вы ввели некорректные данные"
  	  	  break
      end
    end
  end

  def hook_unhook_wagon
    loop do
      break if @trains.count == 0
      puts "1 - добавить вагон, 2 - отцепить вагон. 0 - выйти"
      input = gets.chomp.to_i
      break if input == 0
      @trains.each {|train| puts "Поезд №#{train.number} - #{train.type}"}
      puts "Введите номер поезда"
      number = gets.chomp.to_i
      train = @trains.find {|train| train.number == number}
      unless train
        puts "Поезд не найден"
        retry
      end

      case input
        when 1
          if train.type == "passenger"
            train.hook(PassengerWagon.new)
          elsif train.type == "cargo"
            train.hook(CargoWagon.new)
          end
        when 2
          train.detach(train.wagon_list[-1])
        else
          puts "Неизвестное действие"
        end
        puts "Поезд №#{train.number} состоит из вагонов: #{train.wagon_list.inspect}"
      end

#в разработке

  end
end