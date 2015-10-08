require_relative 'station'

class Route

	attr_reader :station_a, :station_b, :station_list, :station_route

	def initialize(first_station, second_station)
	  @first_station = first_station
	  @second_station = second_station
	  @station_list = []
	  @station_route = [@first_station, @station_list, @second_station].flatten
	end
	
	def add_station (station)
	  @station_list << station
	  self.station_route = [@first_station, @station_list, @second_station].flatten
	end

	def delete_station (station)
	  @station_list.delete(station)
	  self.station_route = [@first_station, @station_list, @second_station].flatten
	end

	def show_stations
	  self.station_route.each do |station|
	  print station.name
	  end
	end	
end