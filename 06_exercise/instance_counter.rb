module InstanceCounter

  @@instances = 0

  def self.instances
    @@instances.size
  end

def initialize
	@@instances += 1

	
end

private

def register_instance

	
end


end