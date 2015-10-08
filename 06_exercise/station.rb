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
	  @@stations << self
	end

	def arrival(train)
	  if @list.include?(train)
	  	print "Поезд #{name} уже стоит на станции" 
	  else
	    @list << train
	    @speed = 0
	  end
	end
	
	def departure(train)
	  if @list.include?(train)
	    @list.delete(train)
	    @speed = 10
	  else
	  print "Поезда под № #{train_number} нет на станции"
	  end
	end

	def trains_type (type)
	  @list.each do |train|
	  print train.number if train.number == type
	  end
    end
end