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
	print "Введите название станции. Введите 0 при завершении"
	name = gets.strip
	break if name == "0"
	@stations << Station.new(name)
  end

  def create_routs
    print "Создание маршрута."
    puts "Введите начальную станицию: "
    first_station = gets.strip
    puts "Введите конечную станицию: "
    second_station = gets.strip
    @routes << Route.new(first_station, second_station)	
  end

  def create_trains
  	print "Создание поезда"
  	loop do
  	  puts "Введите тип поезда: 1 - пассжирский, 2 -грузовой, 0 - завершение ввода."
  	  type = gets.chomp.to_i

      case type
        when 1
	      puts "Введите номер поезда:"
  	      train_number = gets.chomp.to_i
          @trains << PassengerTrain.new(train_number)
        when 2
          puts "Введите номер поезда:"
  	      train_number = gets.chomp.to_i
  	      @trains << CargoTrain.new(train_number)
  	    when 0
  		  break
  	    else
  	  	  puts "Вы ввели некорректные данные"
  	  	  break
      end
    end
  end

  def hook_unhook_wagon

  	
  end
# в разработке

end
