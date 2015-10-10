require_relative 'instance_counter'

class Station
  include InstanceCounter

  @@stations = []

  def self.all
  	@@stations
  end
	
	attr_reader :name, :list

	def initialize(name)
	  @name	= name
	  @list = []
	  validate!
	  @@stations << self
	end

    def valid?
      validate!
      true
    rescue ArgumentError
      false
    end

	def arrival(train)
	  raise TrainError, "Train already here" if @list.include?(train) 
	  @list << train
	  @speed = 0
	end
	
	def departure(train)
	  raise TrainError, "Train already gone" if @list.include?(train) == false
	  @list.delete(train)
	  @speed = 10
	end

	def trains_type(type)
	  @list.each do |train|
	  print train.number if train.number == type
	  end
    end

    protected

    def validate!
      station_name = /^[а-яА-Я0-9]*$/
      raise ArgumentError, "Station can't be blank" if name.nil? || name.empty?
      raise ArgumentError, "Station should be at least 3 symbols" if name.length < 3
      raise ArgumentError, "Wrong station format! Only latters and digitals" if name !~ station_name
    end
end