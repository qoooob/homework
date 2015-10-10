require_relative 'station'

class Route

	attr_reader :first_station, :second_station, :station_list, :station_route

	def initialize(first_station, second_station)
	  @first_station = first_station
	  @second_station = second_station
	  @station_list = []
	  validate!
	  @station_route = [@first_station, @station_list, @second_station].flatten
	end

    def valid?
      validate!
      true
    rescue ArgumentError
      false
    end

	def add_station(station)
	  raise StationError, "This is not object Station" if station.class != Station
	  raise StationError, "Station already exist!" if @station_list.include?(station)
	  @station_list << station
	  self.station_route = [@first_station, @station_list, @second_station].flatten
	end

	def delete_station(station)
	  @station_list.delete(station)
	  self.station_route = [@first_station, @station_list, @second_station].flatten
	end

	def show_stations
	  self.station_route.each do |station|
	  print station.name
	  end
	end

	protected

	def validate!
      station_name = /^[а-яА-Я0-9]*$/
      raise ArgumentError, "Station can't be blank" if first_station.nil? || first_station.empty?
      raise ArgumentError, "Station should be at least 3 symbols" if first_station.length < 3
      raise ArgumentError, "Wrong station format! Only latters and digitals" if first_station !~ station
      raise ArgumentError, "Station can't be blank" if second_station.nil? || second_station.empty?
      raise ArgumentError, "Station should be at least 3 symbols" if second_station.length < 3
      raise ArgumentError, "Wrong station format! Only latters and digitals" if second_station !~ station_name
    end	
end